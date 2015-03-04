# Bash files

These are my personal bash files for Linux which should also work on Mac OS X - currently a work in progress project. That's why everything is still a bit quick and dirty.

Feel free to reuse, clone, etc.

Enjoy!

-binaryanomaly


---

### New features in v0.2
 - Lolcat support
 - Random bash cmd info
 - Last logins hidden by default

For now customize directly in bash_greeter.sh what components you'd like to show.

v0.2 looks like this: ![Bash Welcome Screen v0.2](http://i.imgur.com/jiCK38n.png "Bash Welcome Screen v0.2")


## Setup

Clone the repository into your home directory, it will create the `.bash_files` subdirectory:

```bash
git clone https://github.com/binaryanomaly/bash_files ~/.bash_files
```

Install figlet if you want the big hostname and lolcat if you want it colorized (the script will autodetect both):

**Linux**
```bash
sudo apt-get install figlet lolcat
```

**OS X**
```
brew install figlet
gem install lolcat
```


### Invoke init file from .bashrc (.bash_profile on Mac OS X)

Add the following at the end of your `.bashrc` or `.bash_profile` in your home directory:

```bash
# Bash_dotfiles initialization
if [ -f ~/.bash_files/bash_init.sh ]; then
    . ~/.bash_files/bash_init.sh
fi
```


## File structure

The files live in ~/.bash_files/

| File | Description |
| ---- | ----------- |
| bash_aliases.sh | Defines the aliases and contains the text to be printed |
| bash_colors.sh  | Sets the colors, need tput 256 color support |
| bash_greeter.sh  | Elements / functions that make the welcome screen |
| bash_init.sh  | Init file that sources all the other files (color, prompt, greeter) |
| bash_print_functions.sh  | Print helper functions for centered single and multline strings |
| bash_prompt.sh  | Bash prompt |


-EOF
