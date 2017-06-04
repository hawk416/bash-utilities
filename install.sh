#!/bin/bash
#
# Installs the bash utils in the current users home folder

echo "Found home as: $HOME"

echo "Creating $HOME/.bin and $HOME/.source"
mkdir -p $HOME/.bin
mkdir -p $HOME/.source

for script in $(find $(pwd)/bin -iname "*.sh")
do
	echo "Copying:" $(basename $script)
	cp $script $HOME/.bin
done
for script in $(find $(pwd)/source -iname "*.sh")
do
	echo "Copying:" $(basename $script)
	cp $script $HOME/.source
done

echo "Setting permissions for $HOME/.bin"
chmod -R +x $HOME/.bin/*

printf "Add to .bashrc? [y/n]: "
read var_addbashrc

if [ "$var_addbashrc" == "y" ] || [ "$var_addbashrc" == "yes" ] || [ "$var_addbashrc" == "Y" ] || [ "$var_addbashrc" == "Yes" ]
then

	echo PATH="\"$HOME/.bin:"'$PATH'"\"" >> $HOME/.bashrc
fi