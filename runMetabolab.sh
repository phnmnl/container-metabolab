#!/bin/bash
if [ -e container_script.ml ]
then
   echo "container_script found OK"
   /usr/local/bin/metabolab1d/run_MetaboLab1D.sh /usr/local/bin/MATLAB_Runtime/v91 /mydata/container_script.ml
else 
   echo "no data supplied "
	if ! [ -e "/usr/local/bin/MATLAB_Runtime" ]; then
        	echo "MATLAB Runtime not installed in image"
        	exit 1
	fi

	if ! [ -e "/usr/local/bin/metabolab1d" ]; then
        	echo "Non-gui metabolab not installed in image"
        	exit 1
	fi

    echo "Installation of MATLAB Runtime and non-gui metabolab probably OK"

fi


