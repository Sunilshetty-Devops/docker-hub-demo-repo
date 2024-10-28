 
#FROM  centos:6.6
#MAINTAINER  SUNILKUMAR
#LABEL "VERSION" : "2.0"
#LABEL "IMAGE_NAME" : "AMAZON"
#LABEL "REALESE_DATE" : "27-10-2024"
#RUN /bin/sh -c yum -y check-update   
#RUN yum install -y java-11-openjdk-devel  
#RUN mkdir -p /home/test/tomcat
#RUN cd /home/test/tomcat
#ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz /home/test/tomcat
#RUN /bin/sh -c tar -zxvf apache-tomcat-9.0.96.tar.gz -C /home/test/tomcat
#COPY Amazon.war /home/test/tomcat/apache-tomcat-9.0.96/webapps/
#WORKDIR /home
#ENTRYPOINT ["sh","/home/test/tomcat/apache-tomcat-9.0.96/bin/catalina.sh","run"]
#EXPOSE 8089


FROM centos:7
MAINTAINER SUNILKUMAR
LABEL "VERSION"="2.0"
LABEL "IMAGE_NAME"="AMAZON"
LABEL "RELEASE_DATE"="27-10-2024"

# Install necessary packages and Java
RUN yum -y update && \
    yum install -y java-11-openjdk-devel && \
    yum clean all

# Create the Tomcat directory
RUN mkdir -p /home/test/tomcat

# Download and extract Tomcat
ADD  https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz /home/test/tomcat/
RUN tar -zxvf /home/test/tomcat/apache-tomcat-9.0.96.tar.gz -C /home/test/tomcat/ 

# Copy the WAR file to the Tomcat webapps directory
COPY Amazon.war /home/test/tomcat/webapps/

# Set the working directory
WORKDIR /home/test/tomcat

# Define the entrypoint for the container
ENTRYPOINT ["sh", "bin/catalina.sh", "run"]

# Expose the desired port
EXPOSE 8089

