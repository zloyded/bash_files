# Bash files

These are my personal bash files for Linux which should also work on Mac OS X - currently a work in progress project. That's why everything is still a bit quick and dirty.

Feel free to reuse, clone, etc.

Enjoy!

-binaryanomaly


---

### Updates - New features

##### 07.3.2015
 - Created dedicated /aliases dir, all files matching the pattern `*aliases.sh` will be loaded by default
 - Moved ls and apt into separate files

##### 06.03.2015
 - Created separate file for configuration values

##### 04.03.2015
 - Added more cross-platform robust checks
 - Added reboot required check and message
 - Added basic config switches for info sections


##### 03.03.2015
 - Lolcat support
 - Random bash cmd info
 - Last logins hidden by default

For now customize directly in bash_greeter.sh what components you'd like to show.

Version from 03.03.2015 looks like this: ![Bash Welcome Screen 03032015](http://i.imgur.com/jiCK38n.png "Bash Welcome Screen 03.03.2015")


## Setup

Clone the repository into your home directory, it will create the `.bash_files` subdirectory:

```bash
git clone https://github.com/binaryanomaly/bash_files ~/.bash_files
```


### Invoke init file from .bashrc (.bash_profile on Mac OS X)

Add the following at the end of your `.bashrc` or `.bash_profile` in your home directory:

```bash
# Bash_dotfiles initialization
if [ -f ~/.bash_files/bash_init.sh ]; then
    . ~/.bash_files/bash_init.sh
fi
```

### Additional Packages

Install figlet if you want the big hostname and lolcat if you want it colorized (the script will autodetect both):

**Linux** (apt)
```bash
sudo apt-get install figlet lolcat
```

**OS X** (homebrew)
```
brew install figlet
gem install lolcat
```


## Directory and File structure

The project lives in `~/.bash_files/` 

| Directory | Description |
| ---- | ----------- |
| lib/ | Directory where basefunctionality is stored - `base*.sh` gets sourced |
| aliases/  | Directory for alias definitions - `*.aliases.sh` gets sourced |

<br>


| File | Description |
| ---- | ----------- |
| bash_config.sh  | Project configuration file |
| bash_greeter.sh  | Elements / functions that make the welcome screen |
| bash_init.sh  | Init file that sources all the other files (color, prompt, greeter) |
| bash_prompt.sh  | Bash prompt |
