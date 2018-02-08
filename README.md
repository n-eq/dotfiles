# dotfiles
:wrench: Yet another dotfiles repo...

## Setup

To use this repository as a start for your configuration files:
```sh
$ git clone http://github.com/marrakchino/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ ./setup_dotfiles.sh
# Let the program guide you
```

## New machine

Just run the `startup.sh` script with root privileges.
Options are:
* `apt [--missing]`: install some basic apt packages (or only the missing ones)
* `npm`: same, install npm packages
* `pip`: same, install pip packages
* `bicon`: install and setup bicon 
* `all`: perform all of the above steps

### One-liner alternative
```sh
$ git clone --recursive http://github.com/marrakchino/dotfiles ~/.dotfiles && sh -c ~/.dotfiles/setup_dotfiles.sh
```

## Contributing

Any contribution is welcome, especially concerning the `setup_dotfiles.sh` file.
Corrections and typo fixes are encouraged.
