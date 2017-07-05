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

_input1=$TRAVIS_BUILD_DIR/_generator_lists/good-user-agents.list
_input2=$TRAVIS_BUILD_DIR/_generator_lists/allowed-user-agents.list
_input3=$TRAVIS_BUILD_DIR/_generator_lists/limited-user-agents.list
_input4=$TRAVIS_BUILD_DIR/_generator_lists/bad-user-agents.list
_input5=$TRAVIS_BUILD_DIR/_generator_lists/bad-referrers.list
_input6=$TRAVIS_BUILD_DIR/_generator_lists/google-ip-ranges.list
_input7=$TRAVIS_BUILD_DIR/_generator_lists/bing-ip-ranges.list
_input8=$TRAVIS_BUILD_DIR/_generator_lists/wordpress-theme-detectors.list
_input9=$TRAVIS_BUILD_DIR/_generator_lists/nibbler-seo.list
_input10=$TRAVIS_BUILD_DIR/_generator_lists/cloudflare-ip-ranges.list

# *******************************************************
# Declare temporary database files used during generation
# *******************************************************

_inputdbA=/tmp/version-information.db
_inputdb1=/tmp/good-user-agents.db
_inputdb2=/tmp/allowed-user-agents.db
_inputdb3=/tmp/limited-user-agents.db
_inputdb4=/tmp/bad-user-agents.db
_inputdb5=/tmp/bad-referrers.db
_inputdb6=/tmp/google-ip-ranges.db
_inputdb7=/tmp/bing-ip-ranges.db
_inputdb8=/tmp/wordpress-theme-detectors.db
_inputdb9=/tmp/nibbler-seo.db
_inputdb10=/tmp/cloudflare-ip-ranges.db

# **************************************************
# Declare temporary variables used during generation
# **************************************************

_nginx=$TRAVIS_BUILD_DIR/travisCI/globalblacklist.template
_tmpnginxA=_tmpnginxA
_tmpnginx1=_tmpnginx1
_tmpnginx2=_tmpnginx2
_tmpnginx3=_tmpnginx3
_tmpnginx4=_tmpnginx4
_tmpnginx5=_tmpnginx5
_tmpnginx6=_tmpnginx6
_tmpnginx7=_tmpnginx7
_tmpnginx8=_tmpnginx8
_tmpnginx9=_tmpnginx9
_tmpnginx10=_tmpnginx10

# *************************************************************
# Sort all input lists alphabetically and remove any duplicates
# *************************************************************

sort -u $_input1 -o $_input1
sort -u $_input2 -o $_input2
sort -u $_input3 -o $_input3
sort -u $_input4 -o $_input4
sort -u $_input5 -o $_input5
sort -u $_input6 -o $_input6
sort -u $_input7 -o $_input7
sort -u $_input8 -o $_input8
sort -u $_input9 -o $_input9
sort -u $_input10 -o $_input10

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

echo $START1 >> $_tmpnginx1
while IFS= read -r LINE
do
printf '\t"~%s"\t\t%s\n' "${LINE}" "$ACTION1" >> "$_tmpnginx1"
done < $_input1
echo $END1  >> $_tmpnginx1
mv $_tmpnginx1 $_inputdb1
ed -s $_inputdb1<<\IN
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
rm $_inputdb1

# ********************************
# ALLOWED BOTS - Create and Insert
# ********************************

echo $START2 >> $_tmpnginx2
while IFS= read -r LINE
do
printf '\t"~%s"\t\t%s\n' "${LINE}" "$ACTION2" >> "$_tmpnginx2"
done < $_input2
echo $END2  >> $_tmpnginx2
mv $_tmpnginx2 $_inputdb2
ed -s $_inputdb2<<\IN
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
rm $_inputdb2

# ********************************
# LIMITED BOTS - Create and Insert
# ********************************

echo $START3 >> $_tmpnginx3
while IFS= read -r LINE
do
printf '\t"~%s"\t\t%s\n' "${LINE}" "$ACTION3" >> "$_tmpnginx3"
done < $_input3
echo $END3  >> $_tmpnginx3
mv $_tmpnginx3 $_inputdb3
ed -s $_inputdb3<<\IN
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
rm $_inputdb3

# ****************************
# BAD BOTS - Create and Insert
# ****************************

echo $START4 >> $_tmpnginx4
while IFS= read -r LINE
do
printf '\t"~%s"\t\t%s\n' "${LINE}" "$ACTION4" >> "$_tmpnginx4"
done < $_input4
echo $END4  >> $_tmpnginx4
mv $_tmpnginx4 $_inputdb4
ed -s $_inputdb4<<\IN
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
rm $_inputdb4

# ********************************
# BAD REFERERS - Create and Insert
# ********************************

echo $START5 >> $_tmpnginx5
while IFS= read -r LINE
do
printf '\t"~*%s"\t\t%s\n' "${LINE}" "$ACTION2" >> "$_tmpnginx5"
done < $_input5
echo $END5  >> $_tmpnginx5
mv $_tmpnginx5 $_inputdb5
ed -s $_inputdb5<<\IN
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
rm $_inputdb5

# ************************************
# GOOGLE IP RANGES - Create and Insert
# ************************************

echo $START6 >> $_tmpnginx6
while IFS= read -r LINE
do
printf '\t"%s"\t\t%s\n' "${LINE}" "$ACTION1" >> "$_tmpnginx6"
done < $_input6
echo $END6  >> $_tmpnginx6
mv $_tmpnginx6 $_inputdb6
ed -s $_inputdb6<<\IN
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
rm $_inputdb6

# **********************************
# BING IP RANGES - Create and Insert
# **********************************

echo $START7 >> $_tmpnginx7
while IFS= read -r LINE
do
printf '\t"%s"\t\t%s\n' "${LINE}" "$ACTION1" >> "$_tmpnginx7"
done < $_input7
echo $END7  >> $_tmpnginx7
mv $_tmpnginx7 $_inputdb7
ed -s $_inputdb7<<\IN
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
rm $_inputdb7

# *********************************************
# Wordpress Theme Detectors - Create and Insert
# *********************************************

echo $START8 >> $_tmpnginx8
while IFS= read -r LINE
do
printf '\t"%s"\n' "${LINE}" >> "$_tmpnginx8"
done < $_input8
echo $END8  >> $_tmpnginx8
mv $_tmpnginx8 $_inputdb8
ed -s $_inputdb8<<\IN
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
rm $_inputdb8

# *******************************
# Nibbler SEO - Create and Insert
# *******************************

echo $START9 >> $_tmpnginx9
while IFS= read -r LINE
do
printf '\t"%s"\t\t%s\n' "${LINE}" "$ACTION2" >> "$_tmpnginx9"
done < $_input9
echo $END9  >> $_tmpnginx9
mv $_tmpnginx9 $_inputdb9
ed -s $_inputdb9<<\IN
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
rm $_inputdb9

# ****************************************
# CLOUDFLARE IP RANGES - Create and Insert
# ****************************************

echo $START10 >> $_tmpnginx10
while IFS= read -r LINE
do
printf '\t"%s"\t\t%s\n' "${LINE}" "$ACTION1" >> "$_tmpnginx10"
done < $_input10
echo $END10  >> $_tmpnginx10
mv $_tmpnginx10 $_inputdb10
ed -s $_inputdb10<<\IN
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
rm $_inputdb10


# *******************************************************************************
# PRINT VERSION, SCRIPT RUNTIME and UPDATE INFORMATION INTO GLOBALBLACKLIST FILES
# *******************************************************************************

# Get DATE output into uppercase format
NOW=$(date | tr -s '[:lower:]'  '[:upper:]')
echo $STARTMARKER >> $_tmpnginxA
printf "###################################################\n### Version: "$MY_GIT_TAG"\n### Updated: "$NOW"\n### Bad Referrer Count: "$BAD_REFERRERS"\n### Bad Bot Count: "$BAD_BOTS"\n###################################################\n" >> $_tmpnginxA
echo $ENDMARKER  >> $_tmpnginxA
mv $_tmpnginxA $_inputdbA
ed -s $_inputdbA<<\IN
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
rm $_inputdbA

# **************************************************
# Generate Additional Files and Copy Them to Folders
# **************************************************

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