
#install joomla
bash "install_Joomla" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget http://joomlacode.org/gf/download/frsrelease/17410/76021/Joomla_2.5.7-Stable-Full_Package.tar.gz
  tar zxvf Joomla_2.5.7-Stable-Full_Package.tar.gz  -C /var/www/
     
  EOH
end

#edicion Archivos para papertrail

ruby_block "edit_rsyslog_conf" do
  block do
    bc = Chef::Util::FileEdit.new("/cat/rsyslog.conf")
    bc.insert_line_if_no_match(/# something./,"*.* @logs.papertrailapp.com:39160")
    bc.insert_line_if_no_match(/# something./,"local0.*   @logs.papertrailapp.com:39160")
    bc.write_file
  end
end

ruby_block "edit home s4ds rsyslog.conf" do
  block do
    rf = Chef::Util::FileEdit.new("/etc/httpd/sites-available/default")
    rf.search_file_delete_line(/CustomLog/)
    rf.write_file
  end
end

bash "insert_line" do
  user "root"
  code <<-EOS
  echo "CustomLog '|/usr/bin/logger -p local1.info -t HTTP'" >> /etc/httpd/sites-available/default
  EOS
end

#reiniciar servicio
service "rsyslog" do
  action :restart
end
