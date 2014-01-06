# Vagrant PHP 5.4 Development Environment

## Description

This is a basic Vagrant file which will import a fully provisioned vagrant
base box I created to setup a LAMP developement environment. 

## Includes

* Ubuntu Precise 64
* Apache2
* php 5.4
* mysql (database root password: 12345)
* phpmyadmin
* composer
* pear
* pecl
* ruby 1.8.7-p358
* chef
* puppet
* git
* vim

## Installation

Make sure you have VirtualBox and Vagrant installed. Clone this repository.
Then all you have to do is run the following command from within the
repository.

    $ vagrant up

This will start the VM. Once it boots up, open [http://localhost:8080/](http://localhost:8080/)
to test it.

## WWW 

The www directory is synced to the /var/www directory on the VM. The index page
has links to phpinfo and phpmyadmin to manage the MySql Database. This is also
where you can do your local development on the host machine.
