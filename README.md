# Bash files

These are my personal bash files for Linux - currently a work in progress poroject. That's why everything is still a bit quick and dirty.

Version 0.1 looks like this: ![Bash Welcome Screen v0.1](http://i.imgur.com/3b38gsW.png "Bash Welcome Screen v0.1")


Feel free to reuse, clone, etc.


## Setup

Clone the repository into your home directory, it will create the bash_dotfiles subdirectory:

```bash
git clone https://github.com/binaryanomaly/bash_files
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
if [ -f ~/bash_files/bash_init.sh ]; then
    . ~/bash_files/bash_init.sh
fi
```

### Fix weird behaviour

For some to me yet not understood reason it seems to be necessary to alter the following section in .bashrc in order to make colours work flawlessly when the files reside in a separate dir:

```bash
if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    . ~/bash_files/bash_prompt.sh #<-- Add this and comment out the line before with the prompt
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    . ~/bash_files/bash_prompt.sh #<-- Add this and comment out the line before with the prompt
fi
unset color_prompt force_color_prompt

```



## Files

The files live in ~/bash_files/

 - bash_aliases.sh
 - bash_colors.sh
 - bash_greeter.sh
 - bash_init.sh
 - bash_print_functions.sh
 - bash_prompt.sh

Filenames should be self-speaking for now.




## Dependencies

There are no hard outside dependencies but if you want to have the hostname displayed in ascii font and optionally colored you have to install:

- figlet
- lolcat



Enjoy!

-binaryanomaly
