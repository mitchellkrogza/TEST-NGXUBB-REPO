#!/bin/bash
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
BAD_REFERRERS=$(wc -l < $TRAVIS_BUILD_DIR/_generator_lists/bad-referrers.list)
BAD_BOTS=$(wc -l < $TRAVIS_BUILD_DIR/_generator_lists/bad-user-agents.list)

# *************************************
# Specify input lists for the generator
# *************************************

input1=$TRAVIS_BUILD_DIR/_generator_lists/good-user-agents.list
input2=$TRAVIS_BUILD_DIR/_generator_lists/allowed-user-agents.list
input3=$TRAVIS_BUILD_DIR/_generator_lists/limited-user-agents.list
input4=$TRAVIS_BUILD_DIR/_generator_lists/bad-user-agents.list
input5=$TRAVIS_BUILD_DIR/_generator_lists/bad-referrers.list
input6=$TRAVIS_BUILD_DIR/_generator_lists/google-ip-ranges.list
input7=$TRAVIS_BUILD_DIR/_generator_lists/bing-ip-ranges.list
input8=$TRAVIS_BUILD_DIR/_generator_lists/wordpress-theme-detectors.list
input9=$TRAVIS_BUILD_DIR/_generator_lists/nibbler-seo.list
input10=$TRAVIS_BUILD_DIR/_generator_lists/cloudflare-ip-ranges.list

# *******************************************************
# Declare temporary database files used during generation
# *******************************************************

inputdbA=/tmp/version-information.db
inputdb1=/tmp/good-user-agents.db
inputdb2=/tmp/allowed-user-agents.db
inputdb3=/tmp/limited-user-agents.db
inputdb4=/tmp/bad-user-agents.db
inputdb5=/tmp/bad-referers.db
inputdb6=/tmp/google-ip-ranges.db
inputdb7=/tmp/bing-ip-ranges.db
inputdb8=/tmp/wordpress-theme-detectors.db
inputdb9=/tmp/nibbler-seo.db
inputdb10=/tmp/cloudflare-ip-ranges.db

# **************************************************
# Declare temporary variables used during generation
# **************************************************

nginx=$TRAVIS_BUILD_DIR/travisCI/globalblacklist.template
tmpnginxA=tmpnginxA
tmpnginx1=tmpnginx1
tmpnginx2=tmpnginx2
tmpnginx3=tmpnginx3
tmpnginx4=tmpnginx4
tmpnginx5=tmpnginx5
tmpnginx6=tmpnginx6
tmpnginx7=tmpnginx7
tmpnginx8=tmpnginx8
tmpnginx9=tmpnginx9
tmpnginx10=tmpnginx10

# *************************************************************
# Sort all input lists alphabetically and remove any duplicates
# *************************************************************

sort -u $input1 -o $input1
sort -u $input2 -o $input2
sort -u $input3 -o $input3
sort -u $input4 -o $input4
sort -u $input5 -o $input5
sort -u $input6 -o $input6
sort -u $input7 -o $input7
sort -u $input8 -o $input8
sort -u $input9 -o $input9
sort -u $input10 -o $input10

# ***************************************************************
# Start and End Strings to Search for to do inserts into template
# ***************************************************************

start1="# START GOOD BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
end1="# END GOOD BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
start2="# START ALLOWED BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
end2="# END ALLOWED BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
start3="# START LIMITED BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
end3="# END LIMITED BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
start4="# START BAD BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
end4="# END BAD BOTS ### DO NOT EDIT THIS LINE AT ALL ###"
start5="# START BAD REFERERS ### DO NOT EDIT THIS LINE AT ALL ###"
end5="# END BAD REFERERS ### DO NOT EDIT THIS LINE AT ALL ###"
start6="# START GOOGLE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
end6="# END GOOGLE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
start7="# START BING IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
end7="# END BING IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
start8="# START WP THEME DETECTORS ### DO NOT EDIT THIS LINE AT ALL ###"
end8="# END WP THEME DETECTORS ### DO NOT EDIT THIS LINE AT ALL ###"
start9="# START NIBBLER ### DO NOT EDIT THIS LINE AT ALL ###"
end9="# END NIBBLER ### DO NOT EDIT THIS LINE AT ALL ###"
start10="# START CLOUDFLARE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
end10="# END CLOUDFLARE IP RANGES ### DO NOT EDIT THIS LINE AT ALL ###"
startmarker="### Version Information #"
endmarker="### Version Information ##"

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

GOODBOTSIFS=$IFS
IFS=$'\n'
echo $start1 >> $tmpnginx1
for line in $(cat $input1); do
printf "\t\"~${line}\"\t\t$ACTION1\n" >> $tmpnginx1
done
echo $end1  >> $tmpnginx1
IFS=$GOODBOTSIFS
mv $tmpnginx1 $inputdb1
ed -s $inputdb1<<\IN
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
rm $inputdb1

# ********************************
# ALLOWED BOTS - Create and Insert
# ********************************

ALLOWEDBOTSIFS=$IFS
IFS=$'\n'
echo $start2 >> $tmpnginx2
for line in $(cat $input2); do
printf "\t\"~${line}\"\t\t$ACTION2\n" >> $tmpnginx2
done
echo $end2  >> $tmpnginx2
IFS=$ALLOWEDBOTSIFS
mv $tmpnginx2 $inputdb2
ed -s $inputdb2<<\IN
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
rm $inputdb2

# ********************************
# LIMITED BOTS - Create and Insert
# ********************************

LIMITEDBOTSIFS=$IFS
IFS=$'\n'
echo $start3 >> $tmpnginx3
for line in $(cat $input3); do
printf "\t\"~${line}\"\t\t$ACTION3\n" >> $tmpnginx3
done
echo $end3  >> $tmpnginx3
IFS=$LIMITEDBOTSIFS
mv $tmpnginx3 $inputdb3
ed -s $inputdb3<<\IN
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
rm $inputdb3

# ****************************
# BAD BOTS - Create and Insert
# ****************************

BADBOTSIFS=$IFS
IFS=$'\n'
echo $start4 >> $tmpnginx4
for line in $(cat $input4); do
printf "\t\"~*${line}\"\t\t$ACTION4\n" >> $tmpnginx4
done
echo $end4  >> $tmpnginx4
IFS=$BADBOTSIFS
mv $tmpnginx4 $inputdb4
ed -s $inputdb4<<\IN
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
rm $inputdb4

# ********************************
# BAD REFERERS - Create and Insert
# ********************************

BADREFERER=$IFS
IFS=$'\n'
echo $start5 >> $tmpnginx5
for line in $(cat $input5); do
printf "\t\"~*${line}\"\t\t$ACTION2\n" >> $tmpnginx5
done
echo $end5  >> $tmpnginx5
IFS=$BADREFERER
mv $tmpnginx5 $inputdb5
ed -s $inputdb5<<\IN
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
rm $inputdb5

# ************************************
# GOOGLE IP RANGES - Create and Insert
# ************************************

GOOGLE=$IFS
IFS=$'\n'
echo $start6 >> $tmpnginx6
for line in $(cat $input6); do
printf "\t${line}\t\t$ACTION1\n" >> $tmpnginx6
done
echo $end6  >> $tmpnginx6
IFS=$GOOGLE
mv $tmpnginx6 $inputdb6
ed -s $inputdb6<<\IN
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
rm $inputdb6

# **********************************
# BING IP RANGES - Create and Insert
# **********************************

BING=$IFS
IFS=$'\n'
echo $start7 >> $tmpnginx7
for line in $(cat $input7); do
printf "\t${line}\t\t$ACTION1\n" >> $tmpnginx7
done
echo $end7  >> $tmpnginx7
IFS=$BING
mv $tmpnginx7 $inputdb7
ed -s $inputdb7<<\IN
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
rm $inputdb7

# *********************************************
# Wordpress Theme Detectors - Create and Insert
# *********************************************

WPTHEME=$IFS
IFS=$'\n'
echo $start8 >> $tmpnginx8
for line in $(cat $input8); do
printf "\t${line}\n" >> $tmpnginx8
done
echo $end8  >> $tmpnginx8
IFS=$WPTHEME
mv $tmpnginx8 $inputdb8
ed -s $inputdb8<<\IN
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
rm $inputdb8

# *******************************
# Nibbler SEO - Create and Insert
# *******************************

NIBBLER=$IFS
IFS=$'\n'
echo $start9 >> $tmpnginx9
for line in $(cat $input9); do
printf "\t${line}\t\t$ACTION2\n" >> $tmpnginx9
done
echo $end9  >> $tmpnginx9
IFS=$NIBBLER
mv $tmpnginx9 $inputdb9
ed -s $inputdb9<<\IN
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
rm $inputdb9

# ****************************************
# CLOUDFLARE IP RANGES - Create and Insert
# ****************************************

CLOUDFLARE=$IFS
IFS=$'\n'
echo $start10 >> $tmpnginx10
for line in $(cat $input10); do
printf "\t${line}\t\t$ACTION1\n" >> $tmpnginx10
done
echo $end10  >> $tmpnginx10
IFS=$CLOUDFLARE
mv $tmpnginx10 $inputdb10
ed -s $inputdb10<<\IN
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
rm $inputdb10


# *******************************************************************************
# PRINT VERSION, SCRIPT RUNTIME and UPDATE INFORMATION INTO GLOBALBLACKLIST FILES
# *******************************************************************************

LASTUPDATEIFS=$IFS
IFS=$'\n'
now="$(date)"
end=$(date +%s.%N)    
echo $startmarker >> $tmpnginxA
printf "###################################################\n### Version: "$MY_GIT_TAG"\n### Updated: "$now"\n### Bad Referrer Count: "$BAD_REFERRERS"\n### Bad Bot Count: "$BAD_BOTS"\n###################################################\n" >> $tmpnginxA
echo $endmarker  >> $tmpnginxA
IFS=$LASTUPDATEIFS
mv $tmpnginxA $inputdbA
ed -s $inputdbA<<\IN
1,/### Version Information #/d
/### Version Information ##/,$d
,d
.r /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
/### Version Information #/x
.t.
.,/### Version Information ##/-d
#,p
#,p used to print output replaced with w below to write
w /home/travis/build/mitchellkrogza/TEST-NGXUBB-REPO/travisCI/globalblacklist.template
q
IN
rm $inputdbA

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
sudo cp $nginx $TRAVIS_BUILD_DIR/conf.d/globalblacklist.conf
sudo cp $nginx $TRAVIS_BUILD_DIR/_sample_config_files/Engintron_for_cPanel_WHM_Configuration_Example/etc/nginx/conf.d/globalblacklist.conf

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