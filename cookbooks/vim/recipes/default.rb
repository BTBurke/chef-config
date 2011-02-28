#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "vim-gtk"

template "/home/vagrant/.vimrc" do
	source "vimrc.erb"
	owner "vagrant"
	group "vagrant"
end

template "/root/.vimrc" do
	source "vimrc.erb"
	owner "root"
	group "root"
end
