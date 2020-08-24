ssh ubuntu@172.31.59.183 '
sudo chmod 777 -R /etc/nagios/
sudo echo "allowed_hosts=127.0.0.1,172.31.63.150" >> /etc/nagios/nrpe.cfg '
