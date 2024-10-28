#/bin/bash
FROM ubuntu:20.04
MAINTAINER Sunilkumar
LABEL "image_version" : "4.0"
LABEL "image_name" : "Amazon"
LABEL "release_date" : "24-10-2024"
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN mkdir -p /home/tomcat
RUN cd /home/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz /home/tomcat/
RUN tar -zxvf /home/tomcat/apache-tomcat-9.0.96.tar.gz -C /home/tomcat
COPY Amazon.war /home/tomcat/apache-tomcat-9.0.96/webapps/
WORKDIR /home
ENTRYPOINT ["sh","/home/tomcat/apache-tomcat-9.0.96/bin/catalina.sh","run"]
EXPOSE 8080





