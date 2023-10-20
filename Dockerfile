FROM ubuntu 

RUN apt-get update 
RUN apt-get install -y build-essential wget libopenblas-dev python3 python3-pip python3-pygpu  g++-9
RUN apt-get clean 
RUN pip3 install pandas seaborn matplotlib pymc jupyter watermark
RUN pip3 install scikit-learn statsmodels

RUN useradd -ms /bin/bash pyuser
RUN echo 'pyuser:pymc' | chpasswd
RUN usermod -aG sudo pyuser

# Now working as pyuser
USER pyuser
RUN mkdir /home/pyuser/pymc
WORKDIR /home/pyuser
