#!/bin/bash
#!/bin/bash
if [ -e container_script.ml ]
then
   echo "OK"
   /usr/local/bin/metabolab1d/run_MetaboLab1D.sh /usr/local/bin/MATLAB_Runtime/v91 /mydata/container_script.ml
else 
   echo "add in script"
fi


