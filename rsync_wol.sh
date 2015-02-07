#!/bin/bash
# CAUTION, for the moment this script only works if the SSH port is 21!
# general variables
hour=$(date +%H%M)
day=$(date +%Y%m%d) #date is a command so I changed the name
separator=":"
addressSep="@"

# variables to set
logFile="log_rsync_$day_$hour.txt"
remoteMacAddress="XX:XX:XX:XX:XX:XX"
remoteAddress="YYY.YYY.YYY.YYY"
#remotePort=21 #TODO for sync over the internet
remoteUser="User"
remotePath="/home/User/Backup/"
rsyncArg="-e ssh -az --del --stats --ignore-errors --force"

folder="/home/User/folder_to_save/"
destFolder=$( echo "$folder" | rev | cut -d '/' -f2 | rev) #reverse, take the second field delimited by / then re reverse in order to get the name of the last folder

folderSync()
{
folder="$1"
destFolder=$( echo "$folder" | rev | cut -d '/' -f2 | rev) #reserve, take the second field delimited by / then re reverse
  
echo "destFolder : $destFolder"
echo "rsync" "$rsyncArg" "$folder" "$remoteUser$addressSep$remoteAddress$separator$remotePath$destFolder" 
echo "Saving with Rsync $destFolder " >"$logFile"
rsync -e ssh -az --del --stats --ignore-errors --force "$folder" "$remoteUser$addressSep$remoteAddress$separator$remotePath$destFolder"  1>>"$logFile"
  
}

echo "Rsync script $day $hour" >>"$logFile"
if ping -c 1 -q "$remoteAddress" &> /dev/null
then
  echo "remote $remoteAddress already awaken"
else
	wakeonlan HWaddr "$remoteMacAddress"
	sleep 180 #enough time for the remote host to be fully awaken
fi

folderSync "$folder"

## TODO do the shutdown now but need sudo privilege
