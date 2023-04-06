# brew-compose

Manage Homebrew packages using a configuration file.

Similar to docker-compose, but for Homebrew (or Linuxbrew).

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
                        Path to the configuration file (default: ~/brew-compose.config)
  -p BREW_PATH, --brew-path BREW_PATH
                        Path to the Homebrew command-line executable (default: 'brew')
```
