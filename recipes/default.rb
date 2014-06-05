
bash "install_Joomla" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget http://joomlacode.org/gf/download/frsrelease/17410/76021/Joomla_2.5.7-Stable-Full_Package.tar.gz
  tar zxvf Joomla_2.5.7-Stable-Full_Package.tar.gz  -C /var/www/
     
  EOH
end



ruby_block "edit home s4ds rsyslog.conf" do
  block do
    rc = Chef::Util::FileEdit.new("/etc/rsyslog.conf")
    rc.insert_line_if_no_match(/# of the default configuration above./,"*.*	@logs.papertrailapp.com:39160")
    rc.write_file
  end
end


ruby_block "edit home s4ds rsyslog.conf" do
  block do
    rd = Chef::Util::FileEdit.new("/etc/rsyslog.conf")
    rd.insert_line_if_no_match(/# something./,"local0.*		@logs.papertrailapp.com:39160")
    rd.write_file
  end
end

CustomLog /var/log/httpd/access.log combined

ruby_block "edit home s4ds rsyslog.conf" do
  block do
    rf = Chef::Util::FileEdit.new("/etc/httpd/sites-available/default")
    rf.search_file_replace_line(/CustomLog /var/log/httpd/access.log combined/,"CustomLog "|/usr/bin/logger -p local1.info -t HTTP" combined")
    rf.write_file
  end
end

service "rsyslog" do
  action :restart
end