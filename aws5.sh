ssh ubuntu@172.31.58.245 '
sudo apt-get update
sudo apt-get install nagios-nrpe-server nagios-plugins -y
sudo service nagios-nrpe-server restart
'
