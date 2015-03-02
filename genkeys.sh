keyfile=keys/vagrantssh.key;
if [[ ! -f $keyfile".pub" ]]; then
	rm $keyfile;
	ssh-keygen -N '' -f $keyfile;
fi
ssh-add $keyfile;
