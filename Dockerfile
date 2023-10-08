FROM ubuntu 

# Install base utilities
RUN apt-get update 
RUN apt-get install -y build-essential wget libopenblas-dev python3 python3-pip python3-pygpu  g++-9
RUN apt-get clean 
RUN pip3 install pandas seaborn matplotlib pymc jupyter watermark
