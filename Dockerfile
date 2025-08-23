# Use the official Tomcat 9 image as base image
FROM tomcat:9-jre8-alpine
# FROM tomcat:9.0-jdk17-temurin
# FROM jenkins/jenkins:lts-jdk11

USER root
RUN apt-get update && apt-get install -y maven
USER jenkins

# SET TIME ZONE AND LOCAL TIME
RUN echo "Asia/Kolkata" > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
# END SET TIME ZONE AND LOCAL TIME
WORKDIR /app
 
# Remove the default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/*
 
# Copy your WAR file into the webapps directory of Tomcat
COPY ./target/customer-relationship-management-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Set the time zone to Indian Standard Time (IST)
 
# Expose port 8080 (default Tomcat port)
 
# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]
