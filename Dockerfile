FROM centos:6.9
yum groupinstall 'Development Tools'
yum install jdk openssl-devel tar gzip
ENV APR_VERSION 1.6.3
ENV TC_NATIVE 1.2.14
RUN wget http://mirror.linux-ia64.org/apache//apr/apr-$APR_VERSION.tar.gz
  && tar -zxvf apr-$APR_VERSION.tar.gz
  && cd apr-$APR_VERSION
  &&./configure
  && make
  && make install
CMD [ "/bin/bash" ]
