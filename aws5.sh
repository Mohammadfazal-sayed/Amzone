ssh ubuntu@$ip '
sudo apt-get update
sudo apt-get install nagios-nrpe-server nagios-plugins -y
vim /etc/nagios/nrpe.cfg
server_address=$ip
sudo service nagios-nrpe-server restart
'
