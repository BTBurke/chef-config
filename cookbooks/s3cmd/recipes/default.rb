#
# Cookbook Name:: s3cmd
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "add-repository-s3cmd" do
	code "wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -"
	code "wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list"
end

bash "install-s3cmd" do
	code "apt-get update"
	code "apt-get install s3cmd"
end

#Add identity for both vagrant and root users to pull from S3
template "/home/vagrant/.s3cfg" do
	source "s3cfg.erb"
	owner "vagrant"
	group "vagrant"
end

template "/root/.s3cfg" do
	source "s3cfg.erb"
	owner "root"
	group "root"
end
