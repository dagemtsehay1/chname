#!/bin/bash
# chname script

display_help() {
  echo "Usage: chname [OPTIONS] <dir/file names...>"
  echo "Options:"
  echo "  -l, --lowercase       Change names to lowercase"
  echo "  -u, --uppercase       Change names to uppercase"
  echo "  -r, --recursive       Apply changes recursively"
  echo "  -s, --subdirectories  Include subdirectory names (requires -r)"
  echo "  -h, --help            Display this help message"
  exit 0
}

# Validate arguments
if [[ $# -lt 1 ]]; then
  display_help
fi

RECURSIVE=false
SUBDIRECTORIES=false
CASE_CHANGE=""

# Parse options
while [[ $# -gt 0 ]]; do
  case $1 in
    -r|--recursive)
      RECURSIVE=true
      shift
      ;;
    -s|--subdirectories)
      SUBDIRECTORIES=true
      shift
      ;;
    -l|--lowercase)
      CASE_CHANGE="lower"
      shift
      ;;
    -u|--uppercase)
      CASE_CHANGE="upper"
      shift
      ;;
    -h|--help)
      display_help
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo -e "\n\033[31mUnknown option: $1\033[0m\n"
      display_help
      ;;
    *)
      break
      ;;
  esac
done

# Ensure case change is specified
if [[ -z $CASE_CHANGE ]]; then

  echo -e "\n\033[31mError: Specify either -l (lowercase) or -u (uppercase).\033[0m\n"
  display_help
fi

# Ensure files/directories are specified
if [[ $# -eq 0 ]]; then
  echo -e "\n\033[31mError: No files or directories specified.\033[0m\n"
  display_help
fi

# Function to rename files/directories
rename_item() {
  local item="$1"
  local dirname=$(dirname "$item")
  local basename=$(basename "$item")
  local newname=""

  if [[ $CASE_CHANGE == "lower" ]]; then
    newname=$(echo "$basename" | tr '[:upper:]' '[:lower:]')
  elif [[ $CASE_CHANGE == "upper" ]]; then
    newname=$(echo "$basename" | tr '[:lower:]' '[:upper:]')
  fi

  if [[ "$basename" != "$newname" ]]; then
    mv -n "$item" "$dirname/$newname"
  fi
}

process_items() {
  local items=("$@")

  for item in "${items[@]}"; do

    if [[ -d "$item" ]]; then
      if $RECURSIVE; then
        local contents=()
        if $SUBDIRECTORIES; then
          contents=($(find "$item" -mindepth 1))
        else
          contents=($(find "$item" -type f))
        fi
        process_items "${contents[@]}" 
      fi
      
      if $SUBDIRECTORIES && $RECURSIVE && [[ "$item" != "$item/"* ]] && [[ -d "$item" ]]; then
        rename_item "$item" 
      fi
      if $SUBDIRECTORIES && ! $RECURSIVE; then
        rename_item "$item" 
      fi
    elif [[ -f "$item" ]]; then 
      rename_item "$item"
    else
      echo "Warning: Skipping invalid item: $item"
    fi
  done
}


# Start processing items
process_items "$@"
