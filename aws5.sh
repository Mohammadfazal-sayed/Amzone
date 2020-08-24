ssh ubuntu@172.31.59.183 '
sudo chmod 777 -R /etc/nagios/
sudo echo "allowed_hosts=127.0.0.1,172.31.63.150" >> /etc/nagios/nrpe.cfg '

ssh ubuntu@172.31.63.150 '
sudo chmod 777 -R /usr/local/nagios/
sudo echo " 
define host {
        use                          linux-server
        host_name                    Nagiosslave2
        alias                        Ubuntu Host
        address                      172.31.59.183
        register                     1
}

define host {
        use                          linux-server
        host_name                    NagiosSlave
        alias                        Ubuntu Host
        address                      172.31.57.16
        register                     1
}



define service {
      host_name                       Nagiosslave2,NagiosSlave,
      service_description             PING
      check_command                   check_ping!100.0,20%!500.0,60%
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       Nagiosslave2
      service_description             Check Users
      check_command           check_local_users!20!50
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       Nagiosslave2
      service_description             Local Disk
      check_command                   check_local_disk!20%!10%!/
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       Nagiosslave2
      service_description             Check SSH
      check_command                   check_ssh
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                        1
}

define service {
      host_name                       Nagiosslave2
      service_description             Total Process
      check_command                   check_local_procs!250!400!RSZDT
      max_check_attempts              2
      check_interval                  2
      retry_interval                  2
      check_period                    24x7
      check_freshness                 1
      contact_groups                  admins
      notification_interval           2
      notification_period             24x7
      notifications_enabled           1
      register                       1
}
" >> /usr/local/nagios/etc/servers/host3.cfg

'


