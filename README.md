# brew-compose

brew-compose is a command-line utility that simplifies the management of Homebrew (Linuxbrew) packages using a configuration file, making it easier to maintain and share a consistent package setup across different machines. The concept comes from docker-compose.

With brew-compose, you can keep track of your preferred Homebrew packages in a single file and install or remove packages according to it.

## Installation

Brew Compose can be installed in multiple ways:

1. **Standalone Binary**: You can install Brew Compose as a standalone script. Simply clone the repository and add the script to your system's `PATH` or create a symlink to it from a directory in your `PATH`. You can then use the Brew Compose utility as a command-line tool.

2. **[Fundle](https://github.com/danhper/fundle) Plugin**: Add this to your config.fish.
```
fundle plugin mushanyoung/brew-compose
```

Run the following one-off command

```
fundle install
```

3. **[Oh My Zsh](https://ohmyz.sh/) Plugin**: Clone the Brew Compose repository into the custom plugins directory of Oh My Zsh and add it to your `plugins` list in your `.zshrc` file.

## Config File Format

The configuration file for Brew Compose is a plain text file that lists your desired Homebrew packages, one per line. Each line should contain the name of a package without any additional information or whitespace. The default location for the configuration file is `~/.brew-compose`. Here is an example of a simple configuration file:

```
git
wget
fzf
```

## Usage

Once the config file is ready, use subcommands to manage your packages.

```
usage: brew-compose [-h] [-f CONFIG_FILE] [-p BREW_PATH] {list,install,prune} ...

positional arguments:
  {list,install,prune}  Subcommand to execute (default: list)
    list                List all installed packages, grouped by their status (tracked, dependency, or not tracked)
    install             Install tracked packages that are not installed
    prune               Remove packages that are not tracked by the configuration file and not a dependency of a tracked package

options:
  -h, --help            show this help message and exit
  -f CONFIG_FILE, --config-file CONFIG_FILE
                        Path to the configuration file (default: ~/.brew-compose)
  -p BREW_PATH, --brew-path BREW_PATH
                        Path to the Homebrew command-line executable (default: 'brew')
```
