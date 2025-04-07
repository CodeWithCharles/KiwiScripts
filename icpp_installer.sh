#!/bin/bash

if [ ! -f ~/.zshrc ]; then
	echo "You need to have zsh to use this script."
	exit
fi

echo "Empowered with https://github.com/42-amassias/makefile_file_formatter"
echo "Installing makefile_file_formatter"
sleep 1
git clone https://github.com/42-amassias/makefile_file_formatter /tmp/makefile_file_formatter &> /dev/null
mv /tmp/makefile_file_formatter/mff ~/.local/bin/mff
rm -rf /tmp/makefile_file_formatter

echo "Installing cpp_template"
sleep 1
echo "icpp() {
	if [ -n \"\$1\" ]
	then
		git clone https://github.com/CodeWithCharles/42_cpp_template.git &> /dev/null
		rm -rf 42_cpp_template/.git
		mv 42_cpp_template \"\$1\"
		printf \"Done generating template \$1 !"
	else
		echo \"Usage: icpp <name_of_dir>\"
	fi
}" >> ~/.zshrc

echo "Icpp installed !"
printf '\nUsage: \n\tTo init a new cpp exercice : icpp <name_of_dir>\n\tTo update Files.mk do : mff -r=./src -t=cpp\n\tInside of a cpp template, you can also run : make mff\n'
