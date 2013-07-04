#
# Cookbook Name:: freenx-server
# Recipe:: default
#
# Copyright (C) 2013 MYOB
# 
# All rights reserved - Do Not Redistribute
#

nxsetup_directory = "/usr/lib/nx"
nxsetup_archive_path = "#{Chef::Config[:file_cache_path]}/nxsetup.tar.gz"

package "python-software-properties"

bash "register-freenx-repository" do
  code <<-EOH
    add-apt-repository -y ppa:freenx-team
    apt-get update
  EOH
end

package "freenx-server"

remote_file "#{nxsetup_archive_path}" do
  backup false
  source node["freenx-server"]["setup_archive_url"]
  action :create_if_missing
  notifies :run, "bash[setup-nx-server]", :immediately
end

bash "setup-nx-server" do
  code <<-EOH
    mkdir -p #{nxsetup_directory}
    cd #{nxsetup_directory}
    tar -xvf #{nxsetup_archive_path}
    ./nxsetup --install --auto
    echo -e "\nCOMMAND_START_GNOME='gnome-session --session=ubuntu-2d'"|tee -a /etc/nxserver/node.conf
    echo -e "\nPasswordAuthentication yes"|tee -a /etc/ssh/sshd_config
  EOH
  action :nothing
  notifies :restart, "service[ssh]", :immediately
end

service "ssh" do
  supports :restart => true
end

# Note: For client connection install: /var/lib/nxserver/home/.ssh/client.id_dsa.key
