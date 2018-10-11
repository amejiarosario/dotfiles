echo '.bash_profile'

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,bash_prompt,path,extra,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

for file in ~/.{bashrc,}; do
	[ -f "$file" ] && source "$file";
done;
unset file;