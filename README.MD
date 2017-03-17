Various bash/perl/python scripts used to manage DNS

*wpeng_dns.sh* - A bash script to automatically change the dns A record of your site's zone file when it detects that WPEngine has changed your IP. This lets you continue to use BIND as your DNS server instead of having to use a DNS service that supports root CNAME records.

Typically, this is run from a CRON job. For example, to run the check every 10 minutes:

*/10 * * * * /home/dnsadmin/wpeng_dns.sh > /dev/null 2>&1
