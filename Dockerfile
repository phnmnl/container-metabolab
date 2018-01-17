FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version=0.99.8.8
LABEL version=0.6

LABEL software=metabolab

RUN apt-get -y update && apt-get -y install --no-install-recommends  libxtst6 libxrandr2 libxt6 wget zip unzip && \
wget -P /usr/local/bin http://beregond.bham.ac.uk/~nmrlab/metabolabBinary1DLinux/MATLAB_Runtime.zip && \
wget  -P /usr/local/bin http://beregond.bham.ac.uk/~nmrlab/metabolabBinary1DLinux/metabolab1d.zip && \
unzip -d /usr/local/bin /usr/local/bin/MATLAB_Runtime.zip && \
unzip -d /usr/local/bin/metabolab1d /usr/local/bin/metabolab1d.zip && \
cd /usr/local/bin && \
rm -r /usr/local/bin/metabolab1d.zip && \
rm -r /usr/local/bin/MATLAB_Runtime.zip && \
apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD runTest1.sh /usr/local/bin/runTest1.sh
ADD runMetabolab.sh /usr/local/bin/runMetabolab.sh
RUN chmod +x /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runMetabolab.sh
RUN chmod +x /usr/local/bin/metabolab1d/run_MetaboLab1D.sh
ENV PATH=/usr/local/bin:$PATH

WORKDIR /mydata

ENTRYPOINT ["/usr/local/bin/runMetabolab.sh"]
#ENTRYPOINT ["/usr/local/bin/runTest1.sh"]


