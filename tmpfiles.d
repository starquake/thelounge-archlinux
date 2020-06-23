#Type Path        Mode UID  GID  Age Argument
Z /etc/thelounge 0755 thelounge thelounge
z /etc/thelounge/config.js - thelounge thelounge
Z /var/lib/thelounge 0755 thelounge thelounge
d /var/lib/thelounge/users 0750 thelounge thelounge
z "/var/lib/thelounge/users/*" 0640 thelounge thelounge 
L /var/lib/thelounge/config.js - - - - /etc/thelounge/config.js
