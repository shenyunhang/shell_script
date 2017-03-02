#!/bin/bash

#set -e
#set -x

#remotes=("//msra-msm02/d$/users/v-yunshe" "//msra-msm-gpu02/d$/users/v-yunshe" "//msra-msm-gpu04/d$/users/v-yunshe" "//7QLNBD2/d$")
#mount_dirs=("msra-msm02" "msra-msm-gpu02" "msra-msm-gpu04" "7QLNBD2")

remotes=("//7QLNBD2/d$/")
mount_dirs=("7QLNBD2")

BASEDIR=$(dirname "$0")
cred_file="${BASEDIR}/credentials"
length=${#remotes[*]}
echo "${length} remotes need to mount or umount"

cd ~
if [ $# = 1 ] && [ $1 = 0 ]
then
	echo "umounting"
	for mount_dir in ${mount_dirs[*]}
	do
		echo "-------------------------------------------------------------------------"
		echo "umounting ${mount_dir}"
		sudo umount ${mount_dir}
		echo "umount ${mount_dir} Success"
	done
else
	echo "mounting"
	for((n=0;n<${length};n++))
	do
		echo "-------------------------------------------------------------------------"
		echo "mounting ${remotes[n]}"
		mkdir -p ${mount_dirs[n]}
		sudo mount -t cifs -o credentials=${cred_file},uid=1004 ${remotes[n]} ${mount_dirs[n]}
		echo "mount ${remotes[n]} Success"
	done
fi
# sudo umount -a -t cifs -l ./msra-msm-gpu04
