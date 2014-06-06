bash "insert_line" do
  user "root"
  code <<-EOH

echo "\\$ModLoad imfile imfile # Load the module input" >> /home/s4ds/Cheftest.conf
echo "\\$ModLoad imklog for reading kernel log messages " >> /home/s4ds/Cheftest.conf
echo "\\$ModLoad imuxsock for reading the local syslog messages " >> /home/s4ds/Cheftest.conf

### Poa Acess" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileName /var/log/access_log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileTag Poa_access_log:" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileStateFile Poa_access_log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileSeverity info" >> /home/s4ds/Cheftest.conf
echo "\\$InputRunFileMonitor" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileReadMode 2" >> /home/s4ds/Cheftest.conf
echo "\\$IscapeconftrolCharactersOnReceive off" >> /home/s4ds/Cheftest.conf

echo "#### Poa Error" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileName /var/log/httpd/error_log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileTag Poa_error_log:" >> /home/s4ds/Cheftest.conf      
echo "\\$InputFileStateFile Poa_error_log" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileSeverity info" >> /home/s4ds/Cheftest.conf
echo "\\$InputRunFileMonitor" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileReadMode 2" >> /home/s4ds/Cheftest.conf 
echo "\\$EscapeconftrolCharactersOnReceive off" >> /home/s4ds/Cheftest.conf

echo "#### Poa ssl_request_log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileName /var/log/httpd/ssl_request_log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileTag Poa_ssl_request_log:" >> /home/s4ds/Cheftest.conf      
echo "\\$InputFileStateFile Poa_ssl_request_log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileSeverity info" >> /home/s4ds/Cheftest.conf
echo "\\$InputRunFileMonitor" >> /home/s4ds/Cheftest.conf 
echo "\\$EscapeconftrolCharactersOnReceive off" >> /home/s4ds/Cheftest.conf

echo "#### Pos Access" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileName /var/resin/log/access.log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileTag Pos_access_log:" >> /home/s4ds/Cheftest.conf     
echo "\\$InputFileStateFile Pos_access_log" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileSeverity info" >> /home/s4ds/Cheftest.conf 
echo "\\$InputRunFileMonitor" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileReadMode 2" >> /home/s4ds/Cheftest.conf
echo "\\$EscapeconftrolCharactersOnReceive off" >> /home/s4ds/Cheftest.conf


echo "#### Pos jvm-app-0.log" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileName /var/log/resin/jvm-app-0.log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileTag Pos_jvm-app-0_log:" >> /home/s4ds/Cheftest.conf      
echo "\\$InputFileStateFile Pos_jvm-app-0_log" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileSeverity info" >> /home/s4ds/Cheftest.conf 
echo "\\$InputRunFileMonitor" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileReadMode 2" >> /home/s4ds/Cheftest.conf 
echo "\\$EscapeconftrolCharactersOnReceive off" >> /home/s4ds/Cheftest.conf


echo "#### Pos watchdog-manager.log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileName /var/log/resin/watchdog-manager.log" >> /home/s4ds/Cheftest.conf
echo "\\$InputFileTag Pos_watchdog-manager_log:" >> /home/s4ds/Cheftest.conf     
echo "\\$InputFileStateFile Pos_watchdog-manager_log" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileSeverity info" >> /home/s4ds/Cheftest.conf 
echo "\\$InputRunFileMonitor" >> /home/s4ds/Cheftest.conf 
echo "\\$InputFileReadMode 2" >> /home/s4ds/Cheftest.conf 
echo "\\$EscapeconftrolCharactersOnReceive off" >> /home/s4ds/Cheftest.conf



echo "\\$InputFilePollInterval  \\$10" >> /home/s4ds/Cheftest.conf 

echo "*.*          @logs.papertrailapp.com:39160" >> /home/s4ds/Cheftest.conf

  EOH
end

#reiniciar servicio
service "rsyslog" do
  action :restart
end
