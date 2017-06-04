# bash-utilities

## Introduction

Collection of scripts to simplify daily life.

Things under bin should be run as scripts while anything under source should be sourced from the current shell.

### Pass
Pass scripts are based around having multiple password stores and gpg keys. Pass works with the PASSWORD_STORE_DIR environment variable. By manipulating that variable, multiple password stores and associated gpg keys can be easilly used.

Scripts:
- source/pass_change_store.sh : Source this with a path to the new store
- bin/create_gpg_key.sh : wrapper around gpg2 for simplicity
- bin/pass_create_store.sh : Helps in the creation of a new store

### Vlc
- bin/vlc.sh : Start/Stop script for vlc with http interface

### SSH
- bin/create_rsa_key.sh : wrapper around ssh-keygen to make it easier to create ssh keys

### AWS
- source/aws_init.sh : sets AWS access and secret key from pass path
