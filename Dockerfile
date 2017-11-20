FROM ubuntu:trusty
MAINTAINER codecounter<codecounter@126.com>

# install php7
RUN apt-get update && \
    apt-get install python-software-properties software-properties-common -y && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install php7.0 php7.0-fpm php7.0-mysql -y && \
    apt-get install php7.0-mbstring php7.0-xml php7.0-zip -y

CMD ["/bin/bash"]
