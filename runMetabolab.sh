#!/bin/bash

#cd /mydata
echo "first hello" >> outputfile



##### need to import files needed - container_script.ml & data
# for my runTest1.sh I just imported some data with wget but here I need to tell it to get the data that the user uploaded - this is what I don't know how to do

/usr/local/bin/metabolab1d/run_MetaboLab1D.sh /usr/local/bin/MATLAB_Runtime/v91 /mydata/container_script.ml


######### need to export files produced from container


echo "second hello" >> outputfile


