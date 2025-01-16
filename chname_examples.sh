#!/bin/bash
# chname_examples script

# Setup test environment
mkdir -p demo/test_subdir
touch demo/FILE1 demo/File2 demo/test_subdir/File3 demo/test_subdir/file4

echo "Initial structure:"
tree demo

# Test cases
echo -e "\nTest: Convert file names to lowercase in the current directory\n\n./chname.sh -l demo/*\n"
./chname.sh -l demo/*
tree demo

echo -e "\nTest: Convert file names to uppercase recursively\n\n./chname.sh -r -u demo\n"
./chname.sh -r -u demo
tree demo

echo -e "\nTest: Convert subdirectory names to lowercase recursively\n\n./chname.sh -r -s -l demo\n"
./chname.sh -r -s -l demo
tree demo

echo -e "\nTest: Invalid usage examples\n\n./chname.sh -x demo"
./chname.sh -x demo

echo -e "\n./chname.sh -l"
./chname.sh -l

echo -e "\n./chname.sh demo"
./chname.sh demo

# Cleanup
rm -rf demo
