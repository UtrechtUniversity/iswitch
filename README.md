# iswitch
easy switching between iRODS iCommands configurations

iswitch is a script for managing iRODS iCommands configurations. It is
intended for situations when you need to be able to switch easily between
multiple configurations, for example if you need to work with multiple
nonfederated zones or with multiple user accounts. The advantage of using
iswitch is that you can switch between configurations with a single short
command (e.g. `iswitch to production`), rather than having to adjust
environment variables and log in again after every configuration switch.

## Installation

iswitch requires Python 3. It has been tested with Python 3.6.x and higher.
If your Linux distribution doesn't include Python 3, you'll need to install it
first. Example command for CentOS 7:

```
sudo yum install python3
```

Put the iswitch script somewhere in your path. For example:

```
sudo install -m 0755 -g root -o root iswitch /usr/local/bin/iswitch
```

Then initialize iswitch with the current iCommands configuration:

```
iswitch init
```

### Customizing the shell prompt

If you'd like your shell prompt to show the name of your present iRODS configuration,
you can add a call to iswitch in your prompt definition in ~/.bashrc or ~/.bash\_profile
(depending on your Linux distribution). For example:

```
PS1="[\u@\h:\w \$(/usr/local/bin/iswitch which)] $ "
```

The new prompt will become active when you open a new shell/terminal.

### Command-line completion

If you'd like to have command-line completion for iswitch, first ensure that your
distribution has command line completion installed. Example for CentOS 7:

```
sudo yum -y install epel-release
sudo yum -y install bash-completion
```

Then install the completion script for iswitch:

```
install -m 0644 -o root -g root iswitch-complete.sh /etc/bash_completion.d/iswitch
```

## Usage

Use `iswitch list` to print a list of available configurations, and `iswitch which` to see just the current
configuration.

use `iswitch to CONFIGNAME` to switch to a different configuration. For example: `iswitch to testenvironment`

Use `iswitch add CONFIGNAME FILENAME` to add a configuration. For example:
`iswitch add production irods_environment.production.json`.

Use `iswitch update CONFIGNAME FILENAME` to update a configuration. For example: `iswitch update production updated_config.json`.

Use `iswitch rm CONFIGNAME` to remove a configuration. For example: `iswitch rm testenvironment`.

Use `iswitch clone NEWCONFIGNAME` to clone the current configuration to a new configuration. For example:
`iswitch clone copyofproduction`

Use `iswitch edit` to open the current configuration in an editor. If a default editor has been defined in the EDITOR
environment variable, that one is used. Otherwise vi/vim is used.

Use `iswitch mv SOURCECONFIG DESTINATIONCONFIG` to move or rename a configuration. If you intend to move the current configuration
or overwrite the current configuration, please switch to another config first.
