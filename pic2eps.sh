#!/bin/bash

#set -x

for file in `find ./ -name "*.png"`
do
	echo ${file}
	new_file=`echo "${file}" | sed 's/\.png$/\.eps/'`
	convert ${file} ${new_file}
done

for file in `find ./ -name "*.jpg"`
do
	echo ${file}
	new_file=`echo "${file}" | sed 's/\.jpg$/\.eps/'`
	convert ${file} ${new_file}
done
