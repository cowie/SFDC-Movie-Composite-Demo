#ask for input on the name of the heroku app
echo I hope you ran your automation.sh first - or you wont have a sf org to wire in. So do that first. Ctrl C outta here.
echo Please enter the name of your Heroku App for this rev
echo Only a-z, 0-9, and - are viable here. No non-ascii shenanigans either.
read herokuAppName
echo $herokuAppName selected as your name. Let\'s DO THIS.
#
heroku plugins:install heroku-connect-plugin
heroku apps:create $herokuAppName
heroku addons:create heroku-postgresql -a $herokuAppName
heroku addons:create herokuconnect -a $herokuAppName
heroku connect:info -a $herokuAppName
#
heroku connect:db:set --schema salesforce --db DATABASE_URL -a $herokuAppName
#
echo generating login creds - look below to get what you need to log into connect in a second
sfdx force:user:password:generate 
heroku connect:sf:auth -a $herokuAppName -e sandbox