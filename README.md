# Vagrant PHP 5.4 Development Environment

## Description

This is a basic Vagrant file which will create a PHP 5.4 LAMP developement environment.
This uses a combination of ways to provision the VM. It uses both some chef
cookbooks and a bootstrap script to install packages. 

## Includes

* Ubuntu Precise 64
* Apache2
* php 5.4
* mysql (database root password: 1234)
* phpmyadmin
* composer
* git
* vim

## Installation

Make sure you have VirtualBox and Vagrant installed. Clone this repository.

    $ git clone https://github.com/shireenrao/vagrant-precise64-php54

Now get all submodule

    $ git submodule init && git submodule update

Then all you have to do is run the following command from within the
repository.

    $ vagrant up

This will start the VM. Once it boots up, open [http://localhost:8080/](http://localhost:8080/)
to test it.

You can then login to the VM by running

    $ vagrant ssh

At the VM prompt, now run the postinstall.sh script to install additional tools
and virtualbox guest additions

    $ sudo ./postinstall.sh

## WWW 

The www directory is synced to the /var/www directory on the VM. The index page
has links to phpinfo and phpmyadmin to manage the MySql Database. This is also
where you can do your local development on the host machine.
