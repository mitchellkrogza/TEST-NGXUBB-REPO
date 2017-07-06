<table style="width:100%;margin:0;">
  <tr>
    <td align="left"><img src="https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/blob/master/_assets/_logo_nginx_bad_bot_blocker.png" alt="Nginx Ultimate Bad Bot Spam Referrer Blocker - Nginx Block Bad Bots, Vulnerability Scanners, Malware and Adware, Malicious Sites, Spam Referrers, Bad Referrers, Spam Blocker with DDOS, Wordpress Theme Detector Blocking and Fail2Ban Jail for Repeat Offenders"/></td>
    <td align="right"><a href="https://travis-ci.org/mitchellkrogza/nginx-ultimate-bad-bot-blocker" target="_blank"><img src="https://travis-ci.org/mitchellkrogza/nginx-ultimate-bad-bot-blocker.svg?branch=master"/></a></td>
  </tr>
</table>

# Nginx Bad Bot and User-Agent Blocker, Spam Referrer Blocker, Anti DDOS, Bad IP Blocker and Wordpress Theme Detector Blocker
##### The Ultimate Nginx Bad Bot, User-Agent, Spam Referrer Blocker, Adware, Malware and Ransomware Blocker, Clickjacking Blocker, Click Re-Directing Blocker, SEO Companies and Bad IP Blocker with Anti DDOS System, Nginx Rate Limiting and Wordpress Theme Detector Blocking

### Version Information #
********************************************
#### Version: V3.2017.07.78
#### Bad Referrer Count: 4948
#### Bad Bot Count: 481
********************************************
### Version Information ##

## If this helps you [why not buy me a beer](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BKF9XT6WHATLG):beer:

##### Created by: https://github.com/mitchellkrogza for use on Nginx Web Server https://www.nginx.com/
##### Copyright Mitchell Krog <mitchellkrog@gmail.com>

### Update Notification System - Stay up to date on New Builds and Major Feature Changes 

It is important to please subscribe your email address to the mailing list at **https://groups.google.com/forum/#!forum/nginx-ultimate-bad-bot-blocker**
or simply send a blank email to **nginx-ultimate-bad-bot-blocker+subscribe@googlegroups.com** to subscribe.
Please make sure you are subscribed to notifications to be notified when the blocker is updated and also to be notified when any important or mission critical (potentially breaking) changes take place.

#### Also follow me on twitter @ubuntu101za for update notifications
https://twitter.com/ubuntu101za

# EASY AUTO CONFIGURATION INSTRUCTIONS FOR THE NGINX BAD BOT BLOCKER
## Please follow the instructions below step by step :exclamation:

- This is our new preferred method of installation which is now done through a set of shell scripts contributed to this repo by Stuart Cardall @itoffshore who is one of the Alpine Linux package maintainers. 

- The instructions below are for a quick and painfree installation process which downloads all required files for the blocker and the scripts include adding the required includes to your nginx.conf and nginx .vhost files. The setup script assumes your vhost config files are located in /etc/nginx/sites-available/ and each vhost config file ends with a file extension of .vhost

- For manual installation instructions please see - Please see: https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/blob/master/MANUAL-CONFIGURATION.md

- Both setup-ngxblocker & install-ngxblocker can be configured with custom installation / update locations from the command line. Run the scripts with --help or -h to view options.

## STEP 1:

Download the install, setup and update scripts to your /usr/sbin/ directory and make the scripts executable

```
cd /usr/sbin
sudo wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/install-ngxblocker -O install-ngxblocker
sudo wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/setup-ngxblocker -O setup-ngxblocker
sudo wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/update-ngxblocker -O update-ngxblocker
sudo chmod +x install-ngxblocker
sudo chmod +x setup-ngxblocker
sudo chmod +x update-ngxblocker
```

**Both setup-ngxblocker & install-ngxblocker can be configured with custom installation / update locations from the command line. 
Run the scripts with --help or -h to view options.**

## STEP 2:

Now run the install-ngxblocker script in DRY-MODE which will show you what changes it will make and what files it will download for you. This is only a DRY-RUN so no changes are being made yet.


```
cd /usr/sbin
sudo ./install-ngxblocker
```

This will show you output as follows of the changes that will be made 
**(NOTE: this is only a DRY-RUN no changes have been made)**

```
Checking url: https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/include_filelist.txt

** Dry Run ** | -x or --exec to download files


REPO = https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master

Downloading [FROM]=>  [REPO]/conf.d/globalblacklist.conf            [TO]=>  /etc/nginx/conf.d/globalblacklist.conf
Downloading [FROM]=>  [REPO]/conf.d/botblocker-nginx-settings.conf  [TO]=>  /etc/nginx/conf.d/botblocker-nginx-settings.conf

REPO = https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master

Downloading [FROM]=>  [REPO]/bots.d/blockbots.conf              [TO]=>  /etc/nginx/bots.d/blockbots.conf
Downloading [FROM]=>  [REPO]/bots.d/ddos.conf                   [TO]=>  /etc/nginx/bots.d/ddos.conf
Downloading [FROM]=>  [REPO]/bots.d/whitelist-ips.conf          [TO]=>  /etc/nginx/bots.d/whitelist-ips.conf
Downloading [FROM]=>  [REPO]/bots.d/whitelist-domains.conf      [TO]=>  /etc/nginx/bots.d/whitelist-domains.conf
Downloading [FROM]=>  [REPO]/bots.d/blacklist-user-agents.conf  [TO]=>  /etc/nginx/bots.d/blacklist-user-agents.conf
Downloading [FROM]=>  [REPO]/bots.d/blacklist-ips.conf          [TO]=>  /etc/nginx/bots.d/blacklist-ips.conf
Downloading [FROM]=>  [REPO]/bots.d/bad-referrer-words.conf     [TO]=>  /etc/nginx/bots.d/bad-referrer-words.conf
Downloading [FROM]=>  [REPO]/bots.d/custom-bad-referrers.conf   [TO]=>  /etc/nginx/bots.d/custom-bad-referrers.conf
```

**Both setup-ngxblocker & install-ngxblocker can be configured with custom installation / update locations from the command line. 
Run the scripts with --help or -h to view options.**

## STEP 3:

Now run the install script with the -x parameter to download all the necessary files from the repository:

```
cd /usr/sbin/
sudo ./install-ngxblocker -x
```

This will give you the following output:

```
Checking url: https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/include_filelist.txt


REPO = https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master

Downloading [FROM]=>  [REPO]/conf.d/globalblacklist.conf            [TO]=>  /etc/nginx/conf.d/globalblacklist.conf...OK
Downloading [FROM]=>  [REPO]/conf.d/botblocker-nginx-settings.conf  [TO]=>  /etc/nginx/conf.d/botblocker-nginx-settings.conf...OK

REPO = https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master

Downloading [FROM]=>  [REPO]/bots.d/blockbots.conf              [TO]=>  /etc/nginx/bots.d/blockbots.conf...OK
Downloading [FROM]=>  [REPO]/bots.d/ddos.conf                   [TO]=>  /etc/nginx/bots.d/ddos.conf...OK
Downloading [FROM]=>  [REPO]/bots.d/whitelist-ips.conf          [TO]=>  /etc/nginx/bots.d/whitelist-ips.conf...OK
Downloading [FROM]=>  [REPO]/bots.d/whitelist-domains.conf      [TO]=>  /etc/nginx/bots.d/whitelist-domains.conf...OK
Downloading [FROM]=>  [REPO]/bots.d/blacklist-user-agents.conf  [TO]=>  /etc/nginx/bots.d/blacklist-user-agents.conf...OK
Downloading [FROM]=>  [REPO]/bots.d/blacklist-ips.conf          [TO]=>  /etc/nginx/bots.d/blacklist-ips.conf...OK
Downloading [FROM]=>  [REPO]/bots.d/bad-referrer-words.conf     [TO]=>  /etc/nginx/bots.d/bad-referrer-words.conf...OK
Downloading [FROM]=>  [REPO]/bots.d/custom-bad-referrers.conf   [TO]=>  /etc/nginx/bots.d/custom-bad-referrers.conf...OK
```

The required files have now been downloaded to the correct folders on Nginx for you direct from the repository.

**Both setup-ngxblocker & install-ngxblocker can be configured with custom installation / update locations from the command line. 
Run the scripts with --help or -h to view options.**

## STEP 4:

Now run the setup-ngxblocker script in DRY-MODE which will show you what changes it will make and what files it will download for you. This is only a DRY-RUN so no changes are being made yet.

```
cd /usr/sbin/
sudo ./setup-ngxblocker
```

This will give you output as follows (this output below assumes your nginx.conf file already has the default include of /etc/nginx/conf.d/*)
All Nginx installations I know of have this default include in the nginx.conf file distributed with all versions.

```
Checking url: https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/include_filelist.txt

** Dry Run ** | not updating files | -x or --exec to change files

INFO:      /etc/nginx/conf.d/* detected               => /etc/nginx/nginx.conf
inserting: include /etc/nginx/bots.d/blockbots.conf;  => /etc/nginx/sites-available/default.vhost
inserting: include /etc/nginx/bots.d/ddos.conf;       => /etc/nginx/sites-available/default.vhost
inserting: include /etc/nginx/bots.d/blockbots.conf;  => /etc/nginx/sites-available/site1.com.vhost
inserting: include /etc/nginx/bots.d/ddos.conf;       => /etc/nginx/sites-available/site1.com.vhost
inserting: include /etc/nginx/bots.d/blockbots.conf;  => /etc/nginx/sites-available/site3.com.vhost
inserting: include /etc/nginx/bots.d/ddos.conf;       => /etc/nginx/sites-available/site3.com.vhost
inserting: include /etc/nginx/bots.d/blockbots.conf;  => /etc/nginx/sites-available/site2.com.vhost
inserting: include /etc/nginx/bots.d/ddos.conf;       => /etc/nginx/sites-available/site2.com.vhost

Whitelisting ip:  x.x.x.x    => /etc/nginx/bots.d/whitelist-ips.conf
```

This script also whitelists your IP in the whitelist-ips.conf file for you. 
Further IP's or IP ranges can be added to your customizable whitelits-ips.conf file located in /etc/nginx/bots.d/whitelist-ips.conf.

**Both setup-ngxblocker & install-ngxblocker can be configured with custom installation / update locations from the command line. 
Run the scripts with --help or -h to view options.**

## STEP 5:

Now run the setup script with the -x parameter to make all the necessary changes to your nginx.conf (if required) and also to add the required includes into all your vhost files. 

This setup-ngxblocker script assumes that all your vhost files located in /etc/nginx/sites-available end in an extension .vhost. It is good practice to make all your vhost config files end with a .vhost extension but if you prefer to stick what you already have eg .conf you can simply modify line 10 of setup-ngxblocker to the appropriate extension you use for your vhost files.

For instance if your vhost files end in .conf you will change this line in setup-ngxblocker as follows:

`VHOST_EXT="conf`

So now let's run the setup script and let it make all the changes we need to make the Bot Blocker active on all your sites.

```
cd /usr/sbin/
sudo ./setup-ngxblocker -x
```

You will see output as follows:

```
Checking url: https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/include_filelist.txt

INFO:      /etc/nginx/conf.d/* detected               => /etc/nginx/nginx.conf
inserting: include /etc/nginx/bots.d/blockbots.conf;  => /etc/nginx/sites-available/default.vhost
inserting: include /etc/nginx/bots.d/ddos.conf;       => /etc/nginx/sites-available/default.vhost
inserting: include /etc/nginx/bots.d/blockbots.conf;  => /etc/nginx/sites-available/site1.com.vhost
inserting: include /etc/nginx/bots.d/ddos.conf;       => /etc/nginx/sites-available/site1.com.vhost
inserting: include /etc/nginx/bots.d/blockbots.conf;  => /etc/nginx/sites-available/site3.com.vhost
inserting: include /etc/nginx/bots.d/ddos.conf;       => /etc/nginx/sites-available/site3.com.vhost
inserting: include /etc/nginx/bots.d/blockbots.conf;  => /etc/nginx/sites-available/site2.com.vhost
inserting: include /etc/nginx/bots.d/ddos.conf;       => /etc/nginx/sites-available/site2.com.vhost

Whitelisting ip:  x.x.x.x    => /etc/nginx/bots.d/whitelist-ips.conf
```

You will note it has done the includes in all the .vhost files on my test bed server and also whitelisted your own IP address in the whitelist-ips.conf file for you. Further IP's or IP ranges can be added to your customizable whitelits-ips.conf file located in /etc/nginx/bots.d/whitelist-ips.conf.

What this setup script has done has added the following include statements into your .vhost files for you.

```
# Bad Bot Blocker
include /etc/nginx/bots.d/ddos.conf;
include /etc/nginx/bots.d/blockbots.conf;
```

**Both setup-ngxblocker & install-ngxblocker can be configured with custom installation / update locations from the command line. 
Run the scripts with --help or -h to view options.**

## STEP 6:

Now test your nginx configuration

`sudo nginx -t`

and you should see

```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

## STEP 7: 

Now simply reload / restart Nginx and the Bot Blocker will immediately be active and protecting all your web sites.

`sudo service nginx reload`

or

`sudo service nginx restart`

That's it, the blocker is now active and protecting your sites from thousands of malicious bots and domains.

## STEP 8:

Now setup cron to automatically update the blocker for you every day so you always have the latest up to date protection.

`sudo crontab -e`

Add the following line at the end of your crontab file

`00 22 * * * sudo /usr/sbin/update-ngxblocker` 

This will update the blocker every night for you at 10 PM.

If you want it to update more frequently (as sometimes I push out 3-4 updates a day) you can set it as follows to run the cron every 8 hours, although just once a day is more than enough.

`00 */8 * * * sudo /usr/sbin/update-ngxblocker`       

That's it, the blocker will automatically keep itself up to date and also reload Nginx once it has downloaded the latest version of the globalblacklist.conf file.

## STEP 9:

You can now customize any of the following files below to suit your environment or requirements. These include files never get modified during an update using the auto update script above so whatever customizations you do here will never be overwritten during an update.

```
/etc/nginx/bots.d/whitelist-ips.conf
/etc/nginx/bots.d/whitelist-domains.conf
/etc/nginx/bots.d/blacklist-user-agents.conf
/etc/nginx/bots.d/blacklist-ips.conf
/etc/nginx/bots.d/bad-referrer-words.conf
/etc/nginx/bots.d/custom-bad-referrers.conf
```

Let's say for some "obscure" reason you actually want to block GoogleBot from accessing your site. You would simply add it to the /etc/nginx/bots.d/blacklist-user-agents.conf file and it will over-ride the default whitelist for GoogleBot. the same applies to any other bots that are whitelisted by default.

All include files are commented for your convenience.

### Coding makes me very thirsty [why not buy me a beer](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BKF9XT6WHATLG):beer:


## STEP 10: (TEST THAT IT IS WORKING)

**TESTING**

Run the following commands one by one from a terminal on another linux machine against your own domain name. 
**substitute yourdomain.com in the examples below with your REAL domain name**

`curl -A "googlebot" http://yourdomain.com`

Should respond with 200 OK

`curl -A "80legs" http://yourdomain.com`

`curl -A "masscan" http://yourdomain.com`

Should respond with: curl: (52) Empty reply from server

`curl -I http://yourdomain.com -e http://100dollars-seo.com`

`curl -I http://yourdomain.com -e http://zx6.ru`

Should respond with: curl: (52) Empty reply from server

The Nginx Ultimate Bot Blocker is now WORKING and PROTECTING your web sites !!!


### WHY BLOCK BAD BOTS ?

##### Bad bots are:

-    Bad Referrers 
-    Bad User-Agent Strings
-    Spam Referrers
-    Spam Bots and Bad Bots
-    Sites Linked to Lucrative Malware, Adware and Ransomware Clickjacking Campaigns
-    Vulnerability scanners
-    Gambling and Porn Web Sites
-    E-mail harvesters
-    Content scrapers
-    Aggressive bots that scrape content
-    Image Hotlinking Sites and Image Thieves
-    Bots or Servers linked to viruses or malware
-    Government surveillance bots
-    Botnet Attack Networks (Mirai)
-    Known Wordpress Theme Detectors (Updated Regularly)
-    SEO companies that your competitors use to try improve their SEO
-    Link Research and Backlink Testing Tools
-    Stopping Google Analytics Ghost Spam
-    Browser Adware and Malware (Yontoo etc)

(Over 4000 bad referers, spam referrers, user-agents, bad bots, bad IP's, porn, gambling and clickjacking sites, lucrative seo companies, wordpress theme detectors and counting)

- Includes the creation of a google-exclude.txt file for creating filters / segments in Google Analytics (see instructions lower down)
- Includes the creation of a google-disavow.txt file for use in Google Webmaster Tools (see instructions lower down)
- See sample Nginx SSL Vhost config at: https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/blob/master/NGINX-SSL-Site-Config-Example.md


### If this helps you why not [buy me a beer](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BKF9XT6WHATLG):beer:

## Welcome to the Ultimate Nginx Bad Bot, User-Agent, Spam Referrer Blocker, Adware, Malware and Ransomware Blocker, Click-Jacking Blocker, Click-Redirect Blocker and Bad IP Blocker with Anti DDOS System, Nginx Rate Limiting and Wordpress Theme Detector Blocking.

Bots attempt to make themselves look like other software or web sites by disguising their user agent.  Their user agent names may look harmless, perfectly legitimate even. 

For example, "^Java" but according to Project Honeypot, it's actually one of the most dangerous BUT a lot of legitimate bots out there have "Java" in their user agent string so the approach taken by many to block "Java" is not only ignorant but also blocking out very legitimate crawlers including some of Google's and Bing's and makes it very clear to me that those people writing bot blocking scripts seldom ever test them. 

Spam Referrers and Spam Domain Names use very clever techniques to hop off your sites running very lucrative click-jacking and click-redirecting campaigns which serve ads to unsuspecting people browsing the web or even planting malware, adware or ransomware into their browsers which then become part of their lucrative network of bots. 

This Bot Blocker includes hundreds of domain names and IP addresses that most people will not even see in their Nginx logs. This comes as a result of all my sites running of SSL and using Content-Security-Policy (CSP) which blocks things before they even get to Nginx and I have picked up and continue to pick up some of the worst domains and bots out there. 

A massive amount of Porn, Gambling and Fake News web sites are also blocked in this blocker script which also grows at a rapid pace.

Unfortunately most bot blocker scripts out there are simply copy and pasted from other people's scripts and made  to look like their own work. This one  was inspired by the one created by https://github.com/mariusv and I  contributed to that project but went off into a totally new layout, cleaned it up big time and started from scratch. It is now a completely independent project. It's clean, it works and has been thoroughly tested.

### THE BASICS

This nginx bad bot bot blocker list is designed to be a global Nginx include file and uses the Nginx map $http_user_agent, map $http_referer and geo $validate_client directives.

This way the .conf file is loaded once into memory by Nginx and is available to all web 
sites that you operate. You simply need to use an Include statement in an Nginx vhost conf file.

My methods uses **no complex regex** other than the Name of the Bot. Nginx case matching will do the rest.  You can use Regex if you like but it's NOT needed and I proved it by testing with the Chrome extension User-Agent Switcher for Chrome. (handy util and a must for everyone to test these kinds of blocking scripts)

- The user agent "Aboundex" is found without using "~*Aboundex" ... which means a case insensitive match and is much simpler for anyone to maintain than other lists using complicated and messy Regex patterns.

- If we have a rule, like "~*Image\ Stripper" and a bot decides to change its User-Agent string to "NOT Image Stripper I Promise" he is picked up regardless and blocked immediately. 

I only capitalise bot names in my list for ease of reading and maintenance, remember its 
not case-sensitive so will catch any combination like "Bot" "bOt" and "bOT".

For those of you who SUCK with Regex my Nginx Bad Bot Blocker is your saviour !!!

### IT'S CENTRALISED:

The beauty of this is that it is one central file used by all your web sites.
This means there is only place to make amendments ie. adding new bots that you
discover in your log files. Any changes are applied immediately to all sites after
a simple "sudo service nginx reload". But of course always do a sudo nginx -t to test
any config changes before you reload.

### IT IS TINY AND LIGHTWEIGHT

The file is tiny in size. At the time of this writing and the first public commit of this
the file size including all the commenting "which nginx ignores" currently at **a mere 135 kb in size** and already containing over 4500 bad domains and IP addresses. It is so lightweight that Nginx does not even know it's there. It already contains thousands of entries - total updated at the top of this README. 

### IT IS ACCURATE AND IS FALSE POSITIVE PROOF

Unlike many other bad bot blockers out there for Nginx and Apache where people simply copy and paste lists from others, this list has been built from the ground up and tested thoroughly and I mean thoroughly for now over 10 months. It comes from actual server logs that are monitored daily and there are at least 3-10 new additions to this file almost daily.

It has also been throughly tested for false positives using months of constant and regular testing and monitoring of log files. 

All web sites listed in the bad referers are checked one by one before they are even added. Simply copying  anything that look suspicious in your log file and adding it to a blocker like this without actually seeing  what it is first .... well it's foolish to say the least.

### DROP THEM AND THAT'S IT

Nginx has a lovely error called 444 which just literally drops the connection. All these rules issue a 444 response so if a rule matches, the requesting IP simply get's no response and it would appear that your  server does not exist to them or appears to be offline. 

A test with curl using one of the test command line's documented in the /conf.d/globalblacklist.conf file will give a simple "curl: (52) Empty reply from server" and that's the reply the bad referrers and bots get.

### RATE LIMITING FUNCTIONALITY BUILT IN

For bot's or spiders that you still want to allow but want to limit their visitation rate, you can use the  built in rate limiting functions I have included. The file is extensively commented throughout so you should figure it out otherwise simply message me if you are having problems. 

### PULL REQUESTS:

To contribute your own bad referers, bots or to make corrections to any incorrectly blocked bots or domains please fork a copy of this repository and send pull requests on the individual files located in https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/tree/master/_generator_lists and then send a pull request (PR).

##### Additions, Removals and Corrections will all be checked for accuracy before being merged into main blocker.

### ISSUES:

Log any issues regarding incorrect listings or any other problems on the issues system and they will be investigated and removed if necessary. I responde very quickly to user problems and have helped countless users for days on end to get their bot blocker working. You could say I am mad (disputable) but I love helping people and do not ignore issues or people with problems getting this to work.

## FEATURES OF THE NGINX BAD BOT BLOCKER:

- Extensive Lists of Bad and Known Bad Bots and Scrapers (updated almost daily)
- Blocking of Spam Referrer Domains and Web Sites
- Blocking of SEO data collection companies like Semalt.com, Builtwith.com, WooRank.com and many others (updated regularly)
- Blocking of clickjacking Sites linked to Adware, Malware and Ransomware
- Blocking of Porn and Gambling Web Sites who use Lucrative Ways to Earn Money through Serving Ads by hopping off your domain names and web sites.
- Blocking of Bad Domains and IP's that you cannot even see in your Nginx Logs. Thanks to the Content Security Policy (CSP) on all my SSL sites I can see things trying to pull resources off my sites before they even get to Nginx and get blocked by the CSP.
- Anti DDOS Filter and Rate Limiting of Agressive Bots
- Alphabetically ordered for easier maintenance (Pull Requests Welcomed)
- Commented sections of certain important bots to be sure of before blocking
- Includes the IP range of Cyveillance who are known to ignore robots.txt rules
  and snoop around all over the Internet.
- Whitelisting of Google, Bing and Cloudflare IP Ranges
- Whitelisting of your own IP Ranges that you want to avoid blocking by mistake.
- Ability to add other IP ranges and IP blocks that you want to block out.
- If its out there and it's bad it's already in here and BLOCKED !!

### UNDERSTANDS PUNYCODE / IDN DOMAIN NAMES

A lot of lists out there put funny domains into their hosts file. Your hosts file and DNS will not understand this. This list uses converted domains which are in the correct DNS format to be understood by any operating system. **Avoid using lists** that do not put the correctly formatted domain structure into their lists.

For instance
The domain:

`lifehacĸer.com` (note the K)

actually translates to:

`xn--lifehacer-1rb.com`

You can do an nslookup on any operating system and it will resolve correctly.

`nslookup xn--lifehacer-1rb.com`

```xn--lifehacer-1rb.com
	origin = dns1.yandex.net
	mail addr = iskalko.yandex.ru
	serial = 2016120703
	refresh = 14400
	retry = 900
	expire = 1209600
	minimum = 14400
xn--lifehacer-1rb.com	mail exchanger = 10 mx.yandex.net.
Name:	xn--lifehacer-1rb.com
Address: 78.110.60.230
xn--lifehacer-1rb.com	nameserver = dns2.yandex.net.
xn--lifehacer-1rb.com	text = "v=spf1 redirect=_spf.yandex.net"
xn--lifehacer-1rb.com	nameserver = dns1.yandex.net.
```

- Look at: https://www.charset.org/punycode for more info on this.

## WARNING:

- Please understand why you are using this before you even use this.
- Please do not simply copy and paste without understanding what this is doing.
- Do not become a copy and paste Linux "Guru", learn things properly before you use them and always test everything you do one step at a time.
 
## ALWAYS MONITOR WHAT YOU ARE DOING:

**MAKE SURE to monitor your web site logs** after implementing this. I suggest you first load this into one site and monitor it for any possible false positives before putting this into production on all your web sites.

Do not sit like an ostrich with your head in the sand, being a responsible server operator and web site owner means you must monitor your logs frequently. A reason many of you ended up here in the first place because you saw nasty looking stuff in your Nginx log files.
 
Also monitor your logs daily for new bad referers and user-agent strings that you want to block. Your best source of adding to this list is your own server logs, not mine.
 
Feel free to contribute bad referers from your own logs to this project by sending a Pull Request (PR). You can however rely on this list to keep out 99% of the baddies out there.
 
## HOW TO MONITOR YOUR LOGS DAILY (The Easy Way):

**With great thanks and appreciation to**

https://blog.nexcess.net/2011/01/21/one-liners-for-apache-log-files/

To monitor your top referer's for a web site's log file's on a daily basis use the following simple cron jobs which will email you a list of top referer's / user agents every morning from a particular web site's log files. This is an example for just one cron job for one site. Set up multiple one's for each one you want to monitor. Here is a cron that runs at 8am every morning and emails me the stripped down log of referers. When I say stripped down, the domain of the site and other referers like Google and Bing are stripped from the results. Of course you must change the log file name, domain name and your email address in the examples below. The second cron for collecting User agents does not do any stripping out of any referers but you can add that functionality if you like copying the awk statement !~ from the first example.

##### Cron for Monitoring Daily Referers on Nginx

`00 08 * * * tail -10000 /var/log/nginx/mydomain-access.log | awk '$11 !~ /google|bing|yahoo|yandex|mywebsite.com/' | awk '{print $11}' | tr -d '"' | sort | uniq -c | sort -rn | head -1000 | mail - s "Top 1000 Referers for Mydomain.com" me@mydomain.com`

This emails you a daily list of referrers using an awk command to exclude domains like google, bing and your own domain name.

##### Cron for Monitoring Daily User Agents on Nginx

`00 08 * * * tail -50000 /var/log/nginx/mydomain-access.log | awk '{print $12}' | tr -d '"' | sort | uniq -c | sort -rn | head -1000 | mail -s "Top 1000 Agents for Mydomain.com" me@mydomain.com`

This emails you a list of top User-Agents who visited your site in the last 24 hours, helpful for spotting any rogue or suspicious looking User-Agents strings.

## BLOCK AGGRESSIVE BOTS AT FIREWALL LEVEL USING FAIL2BAN:

I have added a custom Fail2Ban filter and action that I have written which monitors your Nginx logs for bots that generate a large number of 444 errors. This custom jail for Fail2Ban will scan logs over a 1 week period and ban the offender for 24 hours.
It helps a great deal in keeping out some repeat offenders and preventing them from filling up your log files with 444 errors.
See the Fail2Ban folder for instructions on configuring this great add on for the Nginx Bad Bot Blocker.

## STOPPING GOOGLE ANALYTICS "GHOST" SPAM:

Simply using the Nginx blocker does not stop Google Analytics ghost referral spam 
because they are hitting Analytics directly and not always necessarily touching your website. 

You should use regex filters in Analytics to prevent ghost referral spam.
For this simple google-exclude-01.txt, 02.txt and 03.txt files have been created for you and they are updated at the same time when the Nginx Blocker is updated.

## To stop Ghost Spam on On Analytics
Navigate to your Google Analytics Admin panel and add a Segment. (New Segment > Advanced > Conditions)
This will need to be done on each and every site where you want this filter to be in effect. 
Google has a limit on the length of the regex so it is now broken up for you into multiple google-exclude-*.txt files. 


| Filter          | Session       | Include                                  |
| :-------------: |:-------------:|:----------------------------------------:|
| Hostname        | matches regex | ```yourwebsite\.com|www\.yourwebsite\.com``` |

| Filter          | Session       | Exclude                                                       |
| :-------------: |:-------------:|:-------------------------------------------------------------:|
| Hostname        | matches regex | Copy the contents from [google-exclude-01.txt](https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/blob/master/google-exclude-01.txt) to this field |

Do the same step above now for google-exclude-02.txt and google-exclude-03.txt.
As the list grows there will be more google-exclude files each limited to Google's restriction limit.

# Also Better Check Out RefererSpamBlocker

Also check out the awesome [Referer Spam Blocker](https://referrerspamblocker.com)
for Google Analytics which uses a collaborated source of spam domains and automatically adds all the filters to your Analytics sites for you in 2 easy clicks and it is FREE.

## Blocking Spam Domains Using Google Webmaster Tools

I have added the creation of a Google Disavow text file called google-disavow.txt. This file can be used in Google's Webmaster Tools to block all these domains out as spammy or bad links. Use with caution.

## Blocking Bad Bots and User-Agents Strings for those who cannot use this full blocker?

Lots of people are at the peril of their hosting company and do not have root access to the server running behind their web site. If this is your situation check out the automatically generated robots.txt file which will help you to some degree to keep a lot of Bad Bots and User-Agents out of your sites.

## Blocking Spam Referrers Strings for those who cannot use this full blocker?

Lots of people are at the peril of their hosting company and do not have root access to the server running behind their web site. If this is your situation check out the automatically generated .htaccess versions of the Spam Referrer Blocker which can be found in this repository https://github.com/mitchellkrogza/apache-ultimate-bad-bot-blocker/tree/master/.htaccess this .htaccess method (FOR APACHE SITES ONLY) will help you to keep all the Spam Referrers in this blocker out of your site. This is mentioned here as a lot of people using CPanel systems think they are sitting behind an Nginx server but in reality are actually running on an Apache Server sitting behind an Nginx Proxy Server. .htaccess does not work on Nginx sites.

# IT FORKING WORKS !!!

## Just Enjoy now what the Nginx Bad Bot Blocker Can Do For You and Your Web Sites.

### If this helped you why not [buy me a beer](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BKF9XT6WHATLG):beer:

# MIT License

## Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
## https://github.com/mitchellkrogza

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

##### Some other awesome free projects

- https://github.com/mitchellkrogza/apache-ultimate-bad-bot-blocker
- https://github.com/mitchellkrogza/Badd-Boyz-Hosts
- https://github.com/mitchellkrogza/fail2ban-useful-scripts
- https://github.com/mitchellkrogza/linux-server-administration-scripts
- https://github.com/mitchellkrogza/Travis-CI-Nginx-for-Testing-Nginx-Configuration
- https://github.com/mitchellkrogza/Travis-CI-for-Apache-For-Testing-Apache-and-PHP-Configurations
- https://github.com/mitchellkrogza/Fail2Ban-Blacklist-JAIL-for-Repeat-Offenders-with-Perma-Extended-Banning
- https://github.com/funilrys/funceble

##### Into Photography?

Come drop by and visit me at https://mitchellkrog.com

### Acknowledgements & Contributors:

Many Thanks to those contributing to this project.
Many parts of the generator scripts and code running behind this project have been adapted from snippets from hundreds of sources. 
In fact it is so hard to mention everyone but here are a few key people whose little snippets of code have helped me introduce new features all the time. 
Show them some love and check out some of their projects too.

- Stuart Cardall - https://github.com/itoffshore (Install, Update and Setup Scripts & Alpine Linux Package Maintainer)
- Fulinrys - https://github.com/funilrys/funceble (Excellent script for checking ACTIVE, INACTIVE and EXPIRED Domain Names)
- Marius Voila https://github.com/mariusv
- Cătălin Mariș https://github.com/alrra
- deformhead https://github.com/deformhead
- bluedragonz https://github.com/bluedragonz
- Alexander https://github.com/shoonois
- Steven Black https://github.com/StevenBlack
- Fail2Ban - https://github.com/fail2ban
- Stevie-Ray Hartog https://github.com/Stevie-Ray
- Sir Athos from StackOverFlow - http://stackoverflow.com/users/2245910/sir-athos (help with Travis Build Tagging and Committing)
- StackOverflow - http://stackoverflow.com/ (bash scripts from hundreds of questions and answers)
- SuperUser - http://superuser.com/ (snippets from various questions and answers)

If you believe your name should be here, drop me a line.

### Coding makes me very thirsty [why not buy me a beer](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BKF9XT6WHATLG):beer:
