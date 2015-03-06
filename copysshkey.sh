#!/bin/bash
# ----
# Copy a specifed SSH key into the ~/.ssh folder of the docker or virtualbox
# ----

if [[ $1 == '' || $2 == '' ]]; then
	echo "Usage: ./copysshfile.sh (docker|virtualbox) <keyfile>";
else
	destination=$1;
	keyfile=$2;
	tempfile=.sshconfiginfo.tmp

	# Run the ssh-config command only once and save to temp file, to speed up things
	vagrant ssh-config $destination > $tempfile;

	echo "--------------------------------------------------------------------------------";
	localkey=$(cat $tempfile | grep IdentityFile | awk '{ print $2 }');
	hostname=$(cat $tempfile | grep HostName | awk '{ print $2 }');
	port=$(cat $tempfile | grep Port | awk '{ print $2 }');

	echo "Destination: "$destination;
	echo "HostName: "$hostname;
	echo "Port: "$port;
	echo "Key to copy: "$keyfile;
	echo "Localkey: "$localkey;

	echo "--------------------------------------------------------------------------------";
	echo "Trying to copy now: $keyfile ...";

	scp -i $localkey $keyfile vagrant@$hostname:~/.ssh/

	echo "--------------------------------------------------------------------------------";

	rm $tempfile;
fi;
