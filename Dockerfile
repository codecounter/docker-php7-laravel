FROM ubuntu:trusty
MAINTAINER codecounter<codecounter@126.com>

# install php7
RUN apt-get update && \
    apt-get install python-software-properties software-properties-common -y && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install php7.1 php7.1-fpm php7.1-mysql -y && \
    apt-get install php7.1-mbstring php7.1-xml php7.1-zip -y
    
# install composer
RUN cd / && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv /composer.phar /usr/local/bin/composer

# install phpunit
RUN cd / && \
    php -r "copy('https://phar.phpunit.de/phpunit-7.phar', '/phpunit.phar');" && \
    mv /phpunit.phar /usr/local/bin/phpunit && \
    chmod +x /usr/local/bin/phpunit

# install phpcs and phpcbf
RUN cd / && \
    php -r "copy('https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar', '/phpcs.phar');" && \
    mv /phpcs.phar /usr/local/bin/phpcs && \
    chmod +x /usr/local/bin/phpcs

RUN cd / && \
    php -r "copy('https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar', '/phpcbf.phar');" && \
    mv /phpcbf.phar /usr/local/bin/phpcbf && \
    chmod +x /usr/local/bin/phpcbf
    
CMD ["/bin/bash"]
