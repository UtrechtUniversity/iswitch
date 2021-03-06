# iswitch
easy switching between iRODS iCommands configurations

iswitch is a tool for switching between irods iCommands configurations. For
example, for switching between different zones or different user accounts.

## Installation

This tool requires Python 3.x. If you use an older Linux distribution, you
may need to install it first. For example:

```
yum install python3
```

Put the iswitch script somewhere in your path. For example:

```
sudo install -m 0755 iswitch /usr/local/bin/iswitch
```

Then initialize iswitch with the current iCommands configuration:

```
iswitch init
```

If you'd like your shell prompt to show the name of your present iRODS configuration,
you can add a call to iswitch in your prompt definition in ~/.bashrc or ~/.bash\_profile
(depending on your Linux distribution). For example:

```
PS1="[\u@\h:\w \$(/usr/local/bin/iswitch which)] $ "
```

The new prompt will become active when you open a new shell/terminal.

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
