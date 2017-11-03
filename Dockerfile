FROM centos:6.9
RUN yum -y groupinstall 'Development Tools' \
  && yum -y install java-1.8.0-openjdk openssl-devel tar gzip wget
ENV APR_VERSION 1.6.3
ENV TC_NATIVE 1.2.14
RUN wget http://mirror.linux-ia64.org/apache//apr/apr-$APR_VERSION.tar.gz \
  && tar -zxvf apr-$APR_VERSION.tar.gz \
  && cd apr-$APR_VERSION \
  && ./configure \
  && make \
  && make install
CMD [ "/bin/bash" ]
