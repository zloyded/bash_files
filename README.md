# Bash files

These are my personl bash dotfiles for Linux - work in progress, everything's a bit quick and dirty.

Feel free to reuse, clone, etc.


## Setup

1. Clone the repository into your home directors, it will create the bash_dotfiles subdirectory

```bash
git clone https://github.com/binaryanomaly/bash_files.git
```

2. Add the following at the end of your .bashrc in your home directory:

```bash
# Bash_dotfiles initialization
if [ -f ~/bash_dotfiles/bash_init.sh ]; then
    . ~/bash_dotfiles/bash_init.sh
fi
```




## Files

The files live in ~/bash_dotfiles/

 - bash_aliases.sh
 - bash_colors.sh
 - bash_greeter.sh
 - bash_init.sh
 - bash_print_functions.sh
 - bash_prompt.sh
 
Filenames should be self-speaking for now.




## Dependencies

There are no hard outside dependencies but if you want to have the hostname displayed in ascii font you have to install:

- figlet




Enjoy!

-binaryanomaly