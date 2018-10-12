#!/usr/bin/env bash

cd ~/dotfiles/;
echo $(pwd);

git pull origin master;

function checkDiff() {
	for dotfile in $(ls -A | egrep '^\.' | grep -v ".DS_Store"); do
		[ -f "$HOME/$dotfile" ] && git diff "$dotfile" "$HOME/$dotfile";
	done;
}

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

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	checkDiff
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
		echo "Changes applied!";
	else
		echo "Changes NOT applied.";
	fi;
fi;

unset doIt;
unset checkDiff;

cd -