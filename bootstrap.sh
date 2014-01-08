#!/usr/bin/env bash

# Update the box
# --------------
# Downloads the package lists from the repositories
# and "updates" them to get information on the newest
# versions of packages and their dependencies
#apt-get update

# VIM, git etc
# ---
apt-get install -y vim git-core

# Apache
# ------
apt-get install -y apache2
# Remove /var/www default
#rm -rf /var/www
# Symlink /vagrant to /var/www
#ln -fs /vagrant /var/www
# Add ServerName to httpd.conf
echo "ServerName localhost" > /etc/apache2/httpd.conf
# Setup hosts file
#VHOST=$(cat <<EOF
#<VirtualHost *:80>
#  DocumentRoot "/vagrant/public"
#  ServerName localhost
#  <Directory "/vagrant/public">
#    AllowOverride All
#  </Directory>
#</VirtualHost>
#EOF
#)
#echo "${VHOST}" > /etc/apache2/sites-enabled/000-default
# Enable mod_rewrite
a2enmod rewrite
# Restart apache
service apache2 restart

# PHP 5.4
# -------
# Add add-apt-repository binary
apt-get install -y python-software-properties
# Install PHP 5.4
add-apt-repository ppa:ondrej/php5-oldstable
# Update
apt-get update

# PHP stuff
# ---------
apt-get install -y php5 libapache2-mod-php5 php5-cli php5-intl php5-mcrypt php5-gd php5-curl php5-sqlite php5-memcache php-pear php5-xdebug php5-imagick phpunit memcached libmcrypt-dev php5-dev libcurl3-openssl-dev
apt-get install -y php5-mysql
apt-get install -y mcrypt

# cURL
# ----
apt-get install -y curl

# debconf-utils
# -------------
apt-get install -y debconf-utils

# Mysql
# -----
# Ignore the post install questions
#export DEBIAN_FRONTEND=noninteractive
# Install MySQL quietly
#apt-get -q -y install phpmyadmin
# preseed phpmyadmin
echo "phpmyadmin	phpmyadmin/app-password-confirm	password 1234"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/mysql/admin-pass	password 1234"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/password-confirm	password 1234"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/setup-password	password 1234"| debconf-set-selections
# MySQL application 1234 for phpmyadmin:
echo "phpmyadmin	phpmyadmin/mysql/app-pass	password 1234"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/remove-error	select	abort"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/internal/reconfiguring	boolean	false"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/missing-db-package-error	select	abort"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/setup-username	string	admin"| debconf-set-selections
# MySQL username for phpmyadmin:
echo "phpmyadmin	phpmyadmin/db/app-user	string	phpmyadmin"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/install-error	select	abort"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/reconfigure-webserver	multiselect	apache2"| debconf-set-selections
# Host running the MySQL server for phpmyadmin:
echo "phpmyadmin	phpmyadmin/remote/newhost	string"| debconf-set-selections
# Host name of the MySQL database server for phpmyadmin:
echo "phpmyadmin	phpmyadmin/remote/host	select"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/upgrade-error	select	abort"| debconf-set-selections
# Reinstall database for phpmyadmin?
echo "phpmyadmin	phpmyadmin/dbconfig-reinstall	boolean	false"| debconf-set-selections
# Configure database for phpmyadmin with dbconfig-common?
echo "phpmyadmin	phpmyadmin/dbconfig-install	boolean	true"| debconf-set-selections
# MySQL database name for phpmyadmin:
echo "phpmyadmin	phpmyadmin/db/dbname	string	phpmyadmin"| debconf-set-selections
# Database type to be used by phpmyadmin:
echo "phpmyadmin	phpmyadmin/database-type	select	mysql"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/internal/skip-preseed	boolean	false"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/remote/port	string"| debconf-set-selections
# Perform upgrade on database for phpmyadmin with dbconfig-common?
echo "phpmyadmin	phpmyadmin/dbconfig-upgrade	boolean	true"| debconf-set-selections
# Do you want to back up the database for phpmyadmin before upgrading?
echo "phpmyadmin	phpmyadmin/upgrade-backup	boolean	true"| debconf-set-selections
# Deconfigure database for phpmyadmin with dbconfig-common?
echo "phpmyadmin	phpmyadmin/dbconfig-remove	boolean"| debconf-set-selections
#echo "phpmyadmin	phpmyadmin/passwords-do-not-match	error"| debconf-set-selections
# Connection method for MySQL database of phpmyadmin:
echo "phpmyadmin	phpmyadmin/mysql/method	select	unix socket"| debconf-set-selections
echo "phpmyadmin	phpmyadmin/mysql/admin-user	string	root"| debconf-set-selections
# Do you want to purge the database for phpmyadmin?
echo "phpmyadmin	phpmyadmin/purge	boolean	false"| debconf-set-selections
apt-get install -y phpmyadmin

# Install Composer
# ----------------
curl -s https://getcomposer.org/installer | php
# Make Composer available globally
mv composer.phar /usr/local/bin/composer

