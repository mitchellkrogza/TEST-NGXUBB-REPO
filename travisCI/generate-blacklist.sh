#!/bin/sh
# Generator Script for the Nginx Ultimate Bad Bot Blocker
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker

# MIT License

# Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
# https://github.com/mitchellkrogza

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# ******************
# Set Some Variables
# ******************

YEAR=$(date +"%Y")
MONTH=$(date +"%m")
MY_GIT_TAG=V3.$YEAR.$MONTH.$TRAVIS_BUILD_NUMBER
BAD_REFERRERS=$(wc -l < $TRAVIS_BUILD_DIR/_GENERATOR_LISTS/BAD-REFERRERS.list)
BAD_BOTS=$(wc -l < $TRAVIS_BUILD_DIR/_GENERATOR_LISTS/BAD-USER-AGENTS.list)

# *************************************
# Specify input lists for the generator
# *************************************

INPUT1=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/GOOD-USER-AGENTS.list
INPUT2=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/ALLOWED-USER-AGENTS.list
INPUT3=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/LIMITED-USER-AGENTS.list
INPUT4=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/BAD-USER-AGENTS.list
INPUT5=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/BAD-REFERRERS.list
INPUT6=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/GOOGLE-IP-RANGES.list
INPUT7=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/BING-IP-RANGES.list
INPUT8=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/WORDPRESS-THEME-DETECTORS.list
INPUT9=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/NIBBLER-SEO.list
INPUT10=$TRAVIS_BUILD_DIR/_GENERATOR_LISTS/CLOUDFLARE-IP-RANGES.list

# *******************************************************
# Declare temporary database files used during generation
# *******************************************************

INPUTDBA=/tmp/VERSION-INFORMATION.db
INPUTDB1=/tmp/GOOD-USER-AGENTS.db
INPUTDB2=/tmp/ALLOWED-USER-AGENTS.db
INPUTDB3=/tmp/LIMITED-USER-AGENTS.db
INPUTDB4=/tmp/BAD-USER-AGENTS.db
INPUTDB5=/tmp/BAD-REFERRERS.db
INPUTDB6=/tmp/GOOGLE-IP-RANGES.db
INPUTDB7=/tmp/BING-IP-RANGES.db
INPUTDB8=/tmp/WORDPRESS-THEME-DETECTORS.db
INPUTDB9=/tmp/NIBBLER-SEO.db
INPUTDB10=/tmp/CLOUDFLARE-IP-RANGES.db

# **************************************************
# Declare temporary variables used during generation
# **************************************************

NGINX=$TRAVIS_BUILD_DIR/travisCI/globalblacklist.template
TMPNGINXA=TMPNGINXA
TMPNGINX1=TMPNGINX1
TMPNGINX2=TMPNGINX2
TMPNGINX3=TMPNGINX3
TMPNGINX4=TMPNGINX4
TMPNGINX5=TMPNGINX5
TMPNGINX6=TMPNGINX6
TMPNGINX7=TMPNGINX7
TMPNGINX8=TMPNGINX8
TMPNGINX9=TMPNGINX9
TMPNGINX10=TMPNGINX10

# *************************************************************
# Sort all input lists alphabetically and remove any duplicates
# *************************************************************

sort -u $INPUT1 -o $INPUT1
sort -u $INPUT2 -o $INPUT2
sort -u $INPUT3 -o $INPUT3
sort -u $INPUT4 -o $INPUT4
sort -u $INPUT5 -o $INPUT5
sort -u $INPUT6 -o $INPUT6
sort -u $INPUT7 -o $INPUT7
sort -u $INPUT8 -o $INPUT8
sort -u $INPUT9 -o $INPUT9
sort -u $INPUT10 -o $INPUT10

# ***************************************************************
# Start and End Strings to Search for to do inserts into template
# ***************************************************************

START1="# START GOOD BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
END1="# END GOOD BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
START2="# START ALLOWED BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
END2="# END ALLOWED BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
START3="# START LIMITED BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
END3="# END LIMITED BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
START4="# START BAD BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
END4="# END BAD BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
START5="# START BAD REFERERS ### DO NOT EDIT THIS LINE AT ALL ###"
END5="# END BAD REFERERS ### DO NOT EDIT THIS LINE AT ALL ###"
START6="# START GOOGLE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
END6="# END GOOGLE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
START7="# START BING IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
END7="# END BING IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
START8="# START WP THEME DETECTORS ### DO NOT EDIT THIS LINE AT ALL ###"
END8="# END WP THEME DETECTORS ### DO NOT EDIT THIS LINE AT ALL ###"
START9="# START NIBBLER ### DO NOT EDIT THIS LINE AT ALL ###"
END9="# END NIBBLER ### DO NOT EDIT THIS LINE AT ALL ###"
START10="# START CLOUDFLARE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
END10="# END CLOUDFLARE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
STARTMARKER="### VERSION INFORMATION #"
ENDMARKER="### VERSION INFORMATION ##"

# **********************************
# SET ALLOW OR DENY ACTION VARIABLES
# **********************************

ACTION1="0;"
ACTION2="1;"
ACTION3="2;"
ACTION4="3;"


# ************************************
# GOOD USER AGENTS - Create and Insert
# ************************************


#filename="$1"
#while read -r line
#do
#    name="$line"
#    echo "Name read from file - $name"
#done < "$filename"

GOODBOTSIFS=$IFS
IFS=$'\n'
echo $START1 >> $TMPNGINX1

while read -r line
do
#for line in $(cat $INPUT1); do
printf "\t\"~${line}\"\t\t$ACTION1\n" >> $TMPNGINX1
done < $INPUT1

echo $END1  >> $TMPNGINX1
IFS=$GOODBOTSIFS
mv $TMPNGINX1 $INPUTDB1
ed -s $INPUTDB1<<\IN
1,/# START GOOD BOTS ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END GOOD BOTS ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START GOOD BOTS ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END GOOD BOTS ### DO NOT EDIT THIS LINE AT ALL ###/-d
#,p
#,p used to print output replaced with w below to write
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB1

# ********************************
# ALLOWED BOTS - Create and Insert
# ********************************

ALLOWEDBOTSIFS=$IFS
IFS=$'\n'
echo $START2 >> $TMPNGINX2
for line in $(cat $INPUT2); do
printf "\t\"~${line}\"\t\t$ACTION2\n" >> $TMPNGINX2
done
echo $END2  >> $TMPNGINX2
IFS=$ALLOWEDBOTSIFS
mv $TMPNGINX2 $INPUTDB2
ed -s $INPUTDB2<<\IN
1,/# START ALLOWED BOTS ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END ALLOWED BOTS ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START ALLOWED BOTS ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END ALLOWED BOTS ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB2

# ********************************
# LIMITED BOTS - Create and Insert
# ********************************

LIMITEDBOTSIFS=$IFS
IFS=$'\n'
echo $START3 >> $TMPNGINX3
for line in $(cat $INPUT3); do
printf "\t\"~${line}\"\t\t$ACTION3\n" >> $TMPNGINX3
done
echo $END3  >> $TMPNGINX3
IFS=$LIMITEDBOTSIFS
mv $TMPNGINX3 $INPUTDB3
ed -s $INPUTDB3<<\IN
1,/# START LIMITED BOTS ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END LIMITED BOTS ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START LIMITED BOTS ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END LIMITED BOTS ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB3

# ****************************
# BAD BOTS - Create and Insert
# ****************************

BADBOTSIFS=$IFS
IFS=$'\n'
echo $START4 >> $TMPNGINX4
for line in $(cat $INPUT4); do
printf "\t\"~*${line}\"\t\t$ACTION4\n" >> $TMPNGINX4
done
echo $END4  >> $TMPNGINX4
IFS=$BADBOTSIFS
mv $TMPNGINX4 $INPUTDB4
ed -s $INPUTDB4<<\IN
1,/# START BAD BOTS ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END BAD BOTS ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START BAD BOTS ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END BAD BOTS ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB4

# ********************************
# BAD REFERERS - Create and Insert
# ********************************

BADREFERER=$IFS
IFS=$'\n'
echo $START5 >> $TMPNGINX5
for line in $(cat $INPUT5); do
printf "\t\"~*${line}\"\t\t$ACTION2\n" >> $TMPNGINX5
done
echo $END5  >> $TMPNGINX5
IFS=$BADREFERER
mv $TMPNGINX5 $INPUTDB5
ed -s $INPUTDB5<<\IN
1,/# START BAD REFERERS ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END BAD REFERERS ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START BAD REFERERS ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END BAD REFERERS ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB5

# ************************************
# GOOGLE IP RANGES - Create and Insert
# ************************************

GOOGLE=$IFS
IFS=$'\n'
echo $START6 >> $TMPNGINX6
for line in $(cat $INPUT6); do
printf "\t${line}\t\t$ACTION1\n" >> $TMPNGINX6
done
echo $END6  >> $TMPNGINX6
IFS=$GOOGLE
mv $TMPNGINX6 $INPUTDB6
ed -s $INPUTDB6<<\IN
1,/# START GOOGLE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END GOOGLE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START GOOGLE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END GOOGLE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB6

# **********************************
# BING IP RANGES - Create and Insert
# **********************************

BING=$IFS
IFS=$'\n'
echo $START7 >> $TMPNGINX7
for line in $(cat $INPUT7); do
printf "\t${line}\t\t$ACTION1\n" >> $TMPNGINX7
done
echo $END7  >> $TMPNGINX7
IFS=$BING
mv $TMPNGINX7 $INPUTDB7
ed -s $INPUTDB7<<\IN
1,/# START BING IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END BING IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START BING IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END BING IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB7

# *********************************************
# Wordpress Theme Detectors - Create and Insert
# *********************************************

WPTHEME=$IFS
IFS=$'\n'
echo $START8 >> $TMPNGINX8
for line in $(cat $INPUT8); do
printf "\t${line}\n" >> $TMPNGINX8
done
echo $END8  >> $TMPNGINX8
IFS=$WPTHEME
mv $TMPNGINX8 $INPUTDB8
ed -s $INPUTDB8<<\IN
1,/# START WP THEME DETECTORS ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END WP THEME DETECTORS ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START WP THEME DETECTORS ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END WP THEME DETECTORS ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB8

# *******************************
# Nibbler SEO - Create and Insert
# *******************************

NIBBLER=$IFS
IFS=$'\n'
echo $START9 >> $TMPNGINX9
for line in $(cat $INPUT9); do
printf "\t${line}\t\t$ACTION2\n" >> $TMPNGINX9
done
echo $END9  >> $TMPNGINX9
IFS=$NIBBLER
mv $TMPNGINX9 $INPUTDB9
ed -s $INPUTDB9<<\IN
1,/# START NIBBLER ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END NIBBLER ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START NIBBLER ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END NIBBLER ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB9

# ****************************************
# CLOUDFLARE IP RANGES - Create and Insert
# ****************************************

CLOUDFLARE=$IFS
IFS=$'\n'
echo $START10 >> $TMPNGINX10
for line in $(cat $INPUT10); do
printf "\t${line}\t\t$ACTION1\n" >> $TMPNGINX10
done
echo $END10  >> $TMPNGINX10
IFS=$CLOUDFLARE
mv $TMPNGINX10 $INPUTDB10
ed -s $INPUTDB10<<\IN
1,/# START CLOUDFLARE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END CLOUDFLARE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/# START CLOUDFLARE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END CLOUDFLARE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDB10


# *******************************************************************************
# PRINT VERSION, SCRIPT RUNTIME and UPDATE INFORMATION INTO GLOBALBLACKLIST FILES
# *******************************************************************************

LASTUPDATEIFS=$IFS
IFS=$'\n'
#NOW="$(date)"
NOW=$(date | tr -s '[:lower:]'  '[:upper:]')
echo $STARTMARKER >> $TMPNGINXA
printf "###################################################\n### Version: "$MY_GIT_TAG"\n### Updated: "$NOW"\n### Bad Referrer Count: "$BAD_REFERRERS"\n### Bad Bot Count: "$BAD_BOTS"\n###################################################\n" >> $TMPNGINXA
echo $ENDMARKER  >> $TMPNGINXA
IFS=$LASTUPDATEIFS
mv $TMPNGINXA $INPUTDBA
ed -s $INPUTDBA<<\IN
1,/### VERSION INFORMATION #/d
/### VERSION INFORMATION ##/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/### VERSION INFORMATION #/x
.t.
.,/### VERSION INFORMATION ##/-d
#,p
#,p used to print output replaced with w below to write
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $INPUTDBA

# **************************************************
# Generate Additional Files and Copy Them to Folders
# **************************************************

#sudo cp $_input1 $TRAVIS_BUILD_DIR/_generator_lists/good-user-agents.list
#sudo cp $_input2 $TRAVIS_BUILD_DIR/_generator_lists/allowed-user-agents.list
#sudo cp $_input3 $TRAVIS_BUILD_DIR/_generator_lists/limited-user-agents.list
#sudo cp $_input4 $TRAVIS_BUILD_DIR/_generator_lists/bad-user-agents.list
#sudo cp $_input5 $TRAVIS_BUILD_DIR/_generator_lists/bad-referrers.list
#sudo cp $_input6 $TRAVIS_BUILD_DIR/_generator_lists/google-ip-ranges.list
#sudo cp $_input7 $TRAVIS_BUILD_DIR/_generator_lists/bing-ip-ranges.list
#sudo cp $_input8 $TRAVIS_BUILD_DIR/_generator_lists/wordpress-theme-detectors.list
#sudo cp $_input9 $TRAVIS_BUILD_DIR/_generator_lists/nibbler-seo.list
#sudo cp $_input10 $TRAVIS_BUILD_DIR/_generator_lists/cloudflare-ip-ranges.list
sudo cp $NGINX $TRAVIS_BUILD_DIR/conf.d/globalblacklist.conf
sudo cp $NGINX $TRAVIS_BUILD_DIR/_sample_config_files/Engintron_for_cPanel_WHM_Configuration_Example/etc/nginx/conf.d/globalblacklist.conf

exit 0


# MIT License

# Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
# https://github.com/mitchellkrogza

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.