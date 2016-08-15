FROM ubuntu:14.04
MAINTAINER wyx <l631068264@gmail.com>
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY copy-files/sources.list /etc/apt/
RUN apt-get update && apt-get install -y \
  build-essential \
  python-dev \
  libmysqlclient-dev \
  libssl-dev \
  libffi-dev \
  curl 
# Install pip
COPY copy-files/pip.conf /root/.pip/
COPY copy-files/get-pip.py /root/
RUN python /root/get-pip.py
RUN pip install uwsgi
RUN pip install virtualenv
# Install nginx
COPY copy-files/install_nginx.sh /root/
RUN chmod a+x /root/install_nginx.sh
RUN /root/install_nginx.sh
# Install python3.5
COPY copy-files/install_python3.sh /root/
RUN chmod a+x /root/install_python3.sh
RUN /root/install_python3.sh

#EXPOSE 80 443
#CMD nginx
