# Vagrant PHP 5.4 Development Environment

## Description

This is a basic Vagrant file which will import the vagrant base box which I
created from my dropbox. 

## Includes

* Ubuntu Precise 64
* Apache2
* php 5.4
* mysql (root password: 12345)
* phpmyadmin
* git
* vim

## Installation

Make sure you have VirtualBox and Vagrant installed. Clone this repository.
Then all you have to do is run the following command from within the
repository.

    $ vagrant up

This will start the VM. Once it boots up, open [http://localhost:8080/](http://localhost:8080/)
to test it.

