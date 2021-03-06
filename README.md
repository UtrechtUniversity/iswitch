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

## Usage

Use `iswitch list` to print a list of available configurations.

use `iswitch to CONFIGNAME` to switch to a different configuration. For example: `iswitch to testenvironment`

Use `iswitch add CONFIGNAME FILENAME` to add a configuration. For example:
`iswitch add production irods_environment.production.json`.

Use `iswitch update CONFIGNAME FILENAME` to update a configuration. For example: `iswitch update production updated_config.json`.

Use `iswitch rm CONFIGNAME` to remove a configuration. For example: `iswitch rm testenvironment`.

Use `iswitch clone NEWCONFIGNAME` to clone the current configuration to a new configuration. For example:
`iswitch clone copyofproduction`

Use `iswitch edit` to open the current configuration in an editor. If a default editor has been defined in the EDITOR
environment variable, that one is used. Otherwise vi/vim is used.
