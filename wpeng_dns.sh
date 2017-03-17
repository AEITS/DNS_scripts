#
# Author: Steve Chicatelli
# vendor@aeits.com
#
# Purpose: Change DNS record after detecting
# the IP address change in WPEngine site.
#
Old_IP=$(dig +short mydomain.net)
New_IP=$(dig +short mydomain.wpengine.com)
Now=$(date +%Y%m%d%H%M)
CFDNS="/var/cache/bind/db.mydomain.net"
if [[ "$Old_IP" != "$New_IP" ]]
        then
                echo "Change Needed!"
                cp $CFDNS $CFDNS.$Now
                sed "s/$Old_IP/$New_IP/" $CFDNS > $CFDNS.temp
                sed -r "s/[0-9]{10,12}/$Now/" $CFDNS.temp > $CFDNS
                rm $CFDNS.temp
                echo "Changes to DNS record complete"
                echo "Restarting BIND"
                service bind9 restart
        else
                echo "All is Well!"
fi
unset Old_IP
unset New_IP
unset Now
unset CFDNS
