# macstuff
I will put scripts here that have been helpful to me mostly used on the 2018  Macbook Pros

# usernameascompname.sh
usernameascompname.sh gets the current logged on user and chnages the computer name to whatever the name is of the current user. It is intended to be used with https://github.com/chilcote/outset (login-privileged-once)
This script is 99% copied from a script made by deploystudio.com. The only part that I added was looking up who is logged in using this command: 
/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'
