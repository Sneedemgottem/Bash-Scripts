#!/bin/bash
#Title: clang.sh
#Purpose: project initialization for C projects
#Note: Set a CLANG_DIR environment variable if you want a set location. Otherwise it will create it in the current directory.

if [[ $lang == "clang" ]]; then
	dir="."
	
	if [[ -n $CLANG_DIR ]]; then
		dir=$CLANG_DIR
	fi

	# Create and get into the directory
	mkdir "${dir}/$project_name"
	cd "${dir}/$project_name"

	# Work in the root directory
	git init 1>/dev/null
	touch README.md
	touch .gitignore
	echo ".git" >> .gitignore
	echo ".gitignore" >> .gitignore

	# Create the Makefile
	touch Makefile
	echo "CC=gcc" >> Makefile
	echo "FLAGS=-Wall -g" >> Makefile

	# Create source directory
	mkdir src
	touch src/main.c
	echo "#include<stdio.h>" >> src/main.c
	echo "#include<stdlib.h>" >> src/main.c
	echo >> src/main.c
	echo "int main(int argc, char** argv)" >> src/main.c
	echo "{" >> src/main.c
	echo -e "\treturn EXIT_SUCCESS;"
	echo "}" >> src/main.c
fi
