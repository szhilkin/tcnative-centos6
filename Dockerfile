FROM centos:6.9
RUN yum -y groupinstall 'Development Tools' \
  && yum -y install java-1.8.0-openjdk openssl-devel tar gzip wget
ENV APR_VERSION 1.6.3
ENV TC_NATIVE 1.2.16
RUN wget http://mirror.linux-ia64.org/apache//apr/apr-$APR_VERSION.tar.gz \
  && tar -zxvf apr-$APR_VERSION.tar.gz \
  && cd apr-$APR_VERSION \
  && ./configure \
  && make \
  && make install \
  && wget http://mirror.linux-ia64.org/apache/tomcat/tomcat-connectors/native/$TC_NATIVE/source/tomcat-native-$TC_NATIVE-src.tar.gz \
  && tar -zxvf tomcat-native-$TC_NATIVE-src.tar.gz \
  && cd tomcat-native-$TC_NATIVE-src/native \
  && ./configure --with-java-home=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.151-1.b12.el6_9.x86_64 \
  && make \
  && make install
CMD [ "/bin/bash" ]
