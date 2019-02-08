#!/bin/bash
loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
HOMEBREW_PREFIX="/usr/local"
HOMEBREW_CACHE="/Users/$loggedInUser/Library/Caches/Homebrew"




/usr/bin/sudo /bin/mkdir -p /usr/local/etc /usr/local/include /usr/local/lib /usr/local/sbin /usr/local/opt /usr/local/share/zsh /usr/local/share/zsh/site-functions /usr/local/var/homebrew/linked /usr/local/Cellar /usr/local/Caskroom /usr/local/Homebrew /usr/local/Frameworks
/usr/bin/sudo /bin/chmod u+rwx /usr/local/etc /usr/local/include /usr/local/lib /usr/local/sbin /usr/local/opt /usr/local/Frameworks /usr/local/var/homebrew/linked
/usr/bin/sudo /bin/chmod g+rwx /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/sbin /usr/local/share /usr/local/opt /usr/local/var /usr/local/Frameworks /usr/local/etc/bash_completion.d /usr/local/lib/pkgconfig /usr/local/share/aclocal /usr/local/share/doc /usr/local/share/info /usr/local/share/locale /usr/local/share/man /usr/local/share/man/man1 /usr/local/share/man/man2 /usr/local/share/man/man3 /usr/local/share/man/man4 /usr/local/share/man/man5 /usr/local/share/man/man6 /usr/local/share/man/man7 /usr/local/share/man/man8 /usr/local/var/log /usr/local/var/homebrew /usr/local/var/homebrew/linked /usr/local/bin/brew
/usr/bin/sudo /bin/chmod 755 /usr/local/share/zsh /usr/local/share/zsh/site-functions
/usr/bin/sudo /usr/sbin/chown $loggedInUser /usr/local/*
/usr/bin/sudo /usr/bin/chgrp admin /usr/local/Cellar /usr/local/Homebrew /usr/local/Frameworks /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/opt /usr/local/sbin /usr/local/share /usr/local/share/zsh /usr/local/share/zsh/site-functions /usr/local/var

#sudo /bin/chmod u+rwx $chmods 
#sudo /bin/chmod g+rwx $group_chmods 
#sudo /bin/chmod 755 $user_chmods 
#sudo /usr/sbin/chown $loggedInUser $chowns 
#sudo /usr/bin/chgrp admin $chgrps 

sudo /bin/mkdir -p $HOMEBREW_CACHE
sudo /bin/chmod g+rwx $HOMEBREW_CACHE
sudo /usr/sbin/chown $loggedInUser $HOMEBREW_CACHE
sudo /usr/bin/chgrp admin $HOMEBREW_CACHE