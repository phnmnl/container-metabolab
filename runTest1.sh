#!/bin/bash

cd /mydata
wget -O MTBLS1_small.zip http://beregond.bham.ac.uk/~reedma/MTBLS1_small.zip 
unzip MTBLS1_small.zip 
cd MTBLS1_small
mv * ../
cd ..
rm -r MTBLS1_small.zip MTBLS1_small

echo "no data supplied to fetching some to test container"

# check that software was added to image 
if ! [ -e "/usr/local/bin/MATLAB_Runtime" ]; then
	echo "MATLAB Runtime not installed in image"
	exit 1
fi

if ! [ -e "/usr/local/bin/metabolab1d" ]; then
	echo "Non-gui metabolab not installed in image"
	exit 1
fi

echo "Installation of MATLAB Runtime and non-gui metabolab probably OK"
echo "Installation of MATLAB Runtime and non-gui metabolab probably OK" > installed_ok

/usr/local/bin/metabolab1d/run_MetaboLab1D.sh /usr/local/bin/MATLAB_Runtime/v91 /mydata/container_script.ml

echo "hello, hello, hello world!"

if cmp -s s_NEWST123.txt outputted_files/s_NEWST123.txt; then
    echo "s files have the same content"
    echo "s files have the same content" > output_check
else
    echo "s files do NOT have the same content"
    echo "s files do NOT have the same content" > output_check
fi


if cmp -s a_NEWST123_metabolite_profiling_NMR_spectroscopy.txt outputted_files/a_NEWST123_metabolite_profiling_NMR_spectroscopy.txt; then
    echo "a_*.txt isatab assay files identical"
    echo "a_*.txt isatab assay files identical" >> output_check
else
    echo "a_*.txt isatab assay files not identical - a_.txt file problem" 
    echo "a_*.txt isatab assay files not identical - a_.txt file problem" >> output_check
fi

if [ -e "MTBLS1output_batman.csv" ]; then
	echo "Batman file exists"
else
	echo "Batman file does not exist"
	exit 1
fi

if [ -e "metabolabnotgui.mat" ]; then
	echo "mat file exists"
else
	echo "mat file does not exist"
fi
echo "listing some of the files created"
ls MTBLS1*

