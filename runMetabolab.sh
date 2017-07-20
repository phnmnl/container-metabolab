#!/bin/bash
#!/bin/bash
if [ -e container_script.ml ]
then
   echo "container_script found OK"
   /usr/local/bin/metabolab1d/run_MetaboLab1D.sh /usr/local/bin/MATLAB_Runtime/v91 /mydata/container_script.ml
else 
   echo "no data supplied so will fetch test data to check container is working OK"
   /usr/local/bin/runTest1.sh
fi


