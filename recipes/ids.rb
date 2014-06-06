bash "install_ids_client" do
  user "root"
  code <<-EOS
  	wget https://s3-us-west-2.amazonaws.com/automationconsensusapp1/al-threat-host_LATEST.x86_64.rpm
	rpm -ivh al-threat-host_LATEST.x86_64.rpm
	/etc/init.d/al-threat-host provision --key “494eb9d6f029850733e19a768ee4359538e72e88a51df6383c” --inst-type host
 	/etc/init.d/al-threat-host start
  EOS
end
