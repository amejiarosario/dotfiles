#!/usr/bin/env bash

cd ~/dotfiles/;
echo $(pwd);

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "apply.sh" \
		--exclude "README.md" \
		--exclude "README.adoc" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
}

# if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
# else
# 	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
# 	echo "";
# 	if [[ $REPLY =~ ^[Yy]$ ]]; then
# 		doIt;
# 	fi;
# fi;
unset doIt;

cd -