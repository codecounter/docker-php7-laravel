FROM ubuntu:trusty
MAINTAINER codecounter<codecounter@126.com>

# install php7
RUN apt-get update && \
    apt-get install python-software-properties software-properties-common -y && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install php7.1 php7.1-fpm php7.1-mysql -y && \
    apt-get install php7.1-mbstring php7.1-xml php7.1-zip -y

CMD ["/bin/bash"]
