
FROM  centos:7
MAINTAINER  SUNILKUMAR
LABEL "VERSION" : "2.0"
LABEL "IMAGE_NAME" : "AMAZON"
LABEL "REALESE_DATE" : "27-10-2024"
RUN /bin/sh -c yum -y check-update   #yum -y check-update  
RUN yum install -y java-11-openjdk-devel
RUN mkdir -p /home/test/tomcat
RUN cd /home/test/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz /home/test/tomcat
RUN tar -xvf apache-tomcat-9.0.96.tar.gz /home/test/tomcat
COPY Amazon.war /home/test/tomcat/apache-tomcat-9.0.96/webapps/
WORKDIR /home
ENTRYPOINT ["sh","catalina.sh","run"]
EXPOSE 8089



