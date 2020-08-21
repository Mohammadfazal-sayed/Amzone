ssh ubuntu@172.31.50.174 '
sudo apt-get update
sudo apt-get install nagios-nrpe-server nagios-plugins -y
sudo service nagios-nrpe-server restart
'
