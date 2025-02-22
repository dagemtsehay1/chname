# CHNAME
>This repository contains a solution for the ERTS project. The task is described below.
```
Your task is to prepare 2 shell scripts:

1. Write a script  chname  which will have the following syntax:

  chname  [-r|--recursive] [-s|--subdirectories] [-l|--lowercase|-u|-uppercase] <dir/file names...>
  chname  [-h|--help]
  

The goal of the script is to change names of files. The script is dedicated to
lowerizing (-l or --lowercase) file and directory names or uppercasing (-u or
--uppercase) file and directory names given as arguments. 

Changes may be done either with recursion (for all the files in subdirectories
'-r' or --recursive) or without it.  In recursive mode changes may affect only
regular file names  or  subdirectory names (if with '-s' or --subdirectories)
as well.  Option -s without -r allows modification of directory names in the
current directory. Option -h (or --help) should print help message.


2. Write additional script, chname_examples, to demostrate and to test chname
working scenarios, also to test how the script behaves when incorrect arguments
to chname are given. This script should create some set of directories and
files for demonstration, and be prepared ahead of a person in charge of
laboratory evaluation to demonstrate behaviour of your basic chname script
executed with different - correct and incorrect - options and file names, also
for non-trivial scenarious.


--
Examples of correct usage:

chname -l File1 FILE2
chname -u a*
chname -r -u file1 dir1 dir2 dir3
chname -r -s -u file1 file2 dir1 dir2
```

## Cloning the Repository
> To clone this repository, use the following command:
```
git clone https://github.com/dagemtsehay1/chname.git
```
## Running the Scripts
### Prerequisites
>Ensure you have the following:
> - A Unix-based environment (Linux or macOS).
> - Bash shell installed.

### Running the `chname` Script
>To run the chname script, navigate to the repository directory and execute the script with the desired options. 
>
>Examples:

```bash
# Convert file name to lowercase in the current directory
./chname.sh -l FILE1

# Convert file name to uppercase in the current directory
./chname.sh -U file1

# Display help
./chname.sh -h
```

### Running the `chname_examples` Script

>To test the functionality of the chname script with prepared scenarios, run:

```
./chname_examples.sh
```

>This script will:
> - Set up a test environment with sample files and directories.
>- Demonstrate various correct and incorrect usages of the chname script.
>- Automatically clean up the test environment after execution.
>

## Author
> ### Dagem Tsehay Alamrew (342075)