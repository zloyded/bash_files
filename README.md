# Bash files

These are my personal bash files for Linux - currently a work in progress project. That's why everything is still a bit quick and dirty.

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

Install figlet if you want the big hostname (script will autodetect):

```bash
sudo apt-get install figlet
```

Install lolcat if you want the big hostname colorized (script will autodetect):

```bash
sudo apt-get install lolcat
```


### Invoke init file from .bashrc

Add the following at the end of your .bashrc in your home directory:

```bash
# Bash_dotfiles initialization
if [ -f ~/.bash_files/bash_init.sh ]; then
    . ~/.bash_files/bash_init.sh
fi
```


## File structure

The files live in ~/.bash_files/

 - bash_aliases.sh
 - bash_colors.sh
 - bash_greeter.sh
 - bash_init.sh
 - bash_print_functions.sh
 - bash_prompt.sh

Filenames should be self-speaking.

EOF
