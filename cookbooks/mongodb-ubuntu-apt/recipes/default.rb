#
# Cookbook Name:: mongodb-ubuntu-apt
# Recipe:: default
#
# Copyright 2011, MGD
#
# All rights reserved - Do Not Redistribute
#

#Add GPG key for 10gen mongoDB repository
bash "add-apt-mongodb" do
	code "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10"
end

#Add 10gen respository source (stable) and install
bash "add-repository-mongodb" do
	code "echo deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen >> /etc/apt/sources.list"
end

bash "update-repositories" do
	code "apt-get update"
end

bash "install-mongodb" do
	code "apt-get install mongodb-10gen"
end

#Copy configuration file
template "/etc/mongodb.conf" do
 	source "mongodb.conf.erb"
end

#Install pymongo with C-compiled extensions
package "build-essential"
package "python-setuptools"
bash "install-python-bindings" do
	code "easy_install pymongo"
end

