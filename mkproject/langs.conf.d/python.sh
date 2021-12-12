#!/bin/bash
#Title: python.sh
#Author: sneed
#Purpose: project initialization for python projects
#Note: define the environment variable PYTHON_DIR if you want the python projects initialized in a set directory instead of current directory
#Also define VIRTUALENV_PATH for creation of virtual environments

if [[ $lang == "python" ]]; then
	
	dir="."
	
	if [[ -n $PYTHON_DIR ]]; then
		dir=$PYTHON_DIR
	fi

	# Create and get into the directory
	mkdir "${dir}/$project_name"
	cd "${dir}/$project_name"
	
	echo "Initialized python project at ${dir}"

	git init 1>/dev/null
	touch .gitignore
	touch README.md
	echo ".gitignore" > .gitignore

	mkdir src
	touch src/main.py

	# Populate main.py file
	echo "#!/bin/python3" > src/main.py
	echo "#Title: $project_name" >> src/main.py
	echo "#Purpose: " >> src/main.py
	echo "#Date: $(date +%D)" >> src/main.py
	echo "#Author: ${USERNAME}" >> src/main.py
	echo >> src/main.py
	echo "print(\"Hello World!\")" >> src/main.py

	if [[ -n $VIRTUALENV_PATH ]]; then # Would have made a sym link to the activate file but these files are on a fat32 filesystem so it's not supported
		python -m venv "${VIRTUALENV_PATH}/${project_name}" # Create venv
		touch activate # create activate file
		echo "source ${VIRTUALENV_PATH}/${project_name}/bin/activate" > ./activate # create activation file in directory. Activate with 'source ./activate'
		echo "activate" >> ./.gitignore

		echo "Created a virtual environment in ${VIRTUALENV_PATH}/${project_name}"
	fi

fi
