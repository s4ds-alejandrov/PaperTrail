bash "insert_line" do
  user "root"
  code <<-EOH

echo "\\$ModLoad imfile imfile # Load the module input" >> /etc/rsyslog.conf
echo "\\$ModLoad imklog for reading kernel log messages " >> /etc/rsyslog.conf
echo "\\$ModLoad imuxsock for reading the local syslog messages " >> /etc/rsyslog.conf

### Poa Acess" >> /etc/rsyslog.conf
echo "\\$InputFileName /var/log/access_log" >> /etc/rsyslog.conf
echo "\\$InputFileTag Poa_access_log:" >> /etc/rsyslog.conf
echo "\\$InputFileStateFile Poa_access_log" >> /etc/rsyslog.conf
echo "\\$InputFileSeverity info" >> /etc/rsyslog.conf
echo "\\$InputRunFileMonitor" >> /etc/rsyslog.conf
echo "\\$InputFileReadMode 2" >> /etc/rsyslog.conf
echo "\\$IscapeconftrolCharactersOnReceive off" >> /etc/rsyslog.conf

echo "#### Poa Error" >> /etc/rsyslog.conf
echo "\\$InputFileName /var/log/httpd/error_log" >> /etc/rsyslog.conf
echo "\\$InputFileTag Poa_error_log:" >> /etc/rsyslog.conf      
echo "\\$InputFileStateFile Poa_error_log" >> /etc/rsyslog.conf 
echo "\\$InputFileSeverity info" >> /etc/rsyslog.conf
echo "\\$InputRunFileMonitor" >> /etc/rsyslog.conf 
echo "\\$InputFileReadMode 2" >> /etc/rsyslog.conf 
echo "\\$EscapeconftrolCharactersOnReceive off" >> /etc/rsyslog.conf

echo "#### Poa ssl_request_log" >> /etc/rsyslog.conf
echo "\\$InputFileName /var/log/httpd/ssl_request_log" >> /etc/rsyslog.conf
echo "\\$InputFileTag Poa_ssl_request_log:" >> /etc/rsyslog.conf      
echo "\\$InputFileStateFile Poa_ssl_request_log" >> /etc/rsyslog.conf
echo "\\$InputFileSeverity info" >> /etc/rsyslog.conf
echo "\\$InputRunFileMonitor" >> /etc/rsyslog.conf 
echo "\\$EscapeconftrolCharactersOnReceive off" >> /etc/rsyslog.conf

echo "#### Pos Access" >> /etc/rsyslog.conf
echo "\\$InputFileName /var/resin/log/access.log" >> /etc/rsyslog.conf
echo "\\$InputFileTag Pos_access_log:" >> /etc/rsyslog.conf     
echo "\\$InputFileStateFile Pos_access_log" >> /etc/rsyslog.conf 
echo "\\$InputFileSeverity info" >> /etc/rsyslog.conf 
echo "\\$InputRunFileMonitor" >> /etc/rsyslog.conf 
echo "\\$InputFileReadMode 2" >> /etc/rsyslog.conf
echo "\\$EscapeconftrolCharactersOnReceive off" >> /etc/rsyslog.conf


echo "#### Pos jvm-app-0.log" >> /etc/rsyslog.conf 
echo "\\$InputFileName /var/log/resin/jvm-app-0.log" >> /etc/rsyslog.conf
echo "\\$InputFileTag Pos_jvm-app-0_log:" >> /etc/rsyslog.conf      
echo "\\$InputFileStateFile Pos_jvm-app-0_log" >> /etc/rsyslog.conf 
echo "\\$InputFileSeverity info" >> /etc/rsyslog.conf 
echo "\\$InputRunFileMonitor" >> /etc/rsyslog.conf 
echo "\\$InputFileReadMode 2" >> /etc/rsyslog.conf 
echo "\\$EscapeconftrolCharactersOnReceive off" >> /etc/rsyslog.conf


echo "#### Pos watchdog-manager.log" >> /etc/rsyslog.conf
echo "\\$InputFileName /var/log/resin/watchdog-manager.log" >> /etc/rsyslog.conf
echo "\\$InputFileTag Pos_watchdog-manager_log:" >> /etc/rsyslog.conf     
echo "\\$InputFileStateFile Pos_watchdog-manager_log" >> /etc/rsyslog.conf 
echo "\\$InputFileSeverity info" >> /etc/rsyslog.conf 
echo "\\$InputRunFileMonitor" >> /etc/rsyslog.conf 
echo "\\$InputFileReadMode 2" >> /etc/rsyslog.conf 
echo "\\$EscapeconftrolCharactersOnReceive off" >> /etc/rsyslog.conf



echo "\\$InputFilePollInterval  \\$10" >> /etc/rsyslog.conf 

echo "*.*          @logs.papertrailapp.com:39160" >> /etc/rsyslog.conf

  EOH
end

#reiniciar servicio
service "rsyslog" do
  action :restart
end
