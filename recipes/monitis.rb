bash "monitis" do
  user "root"
  code <<-EOS

wget https://dashboard.monitis.com/downloader/monitis-agent-linux-64bit.tar.gz
tar zxvf monitis-agent-linux-64bit.tar.gz  -C /usr/local/
ln -s /lib/libssl.so.0.9.7 /usr/lib/libssl.so.0.9.7

echo "MONITISHOME /usr/local/monitis" >> /usr/local/monitis/etc/monitis.conf
echo "LOGFILE     /usr/local/monitis/logs/monitis.log" >> /usr/local/monitis/etc/monitis.conf
echo "PIDFILE     /usr/local/monitis/logs/monitis.pid" >> /usr/local/monitis/etc/monitis.conf
echo "USEREMAIL   consensus@s4ds.com" >> /usr/local/monitis/etc/monitis.conf
echo "AGENTNAME	  $(curl http://169.254.169.254/latest/meta-data/hostname)" >> /usr/local/monitis/etc/monitis.conf
echo "PLUGINS     /usr/local/monitis/plugins" >> /usr/local/monitis/etc/monitis.conf
echo "APIPASS     3be5f7902b1d7462b5bd357e31a35982" >> /usr/local/monitis/etc/monitis.conf

/usr/local/monitis/monitis.sh start
echo "/usr/local/monitis/monitis.sh start" >>  /etc/rc.local

EOS
end