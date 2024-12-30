# Base image 
FROM tomcat:9-jdk11-openjdk

# Copy your compiled WAR file to the Tomcat webapps directory
COPY ./target/ebt522.war /usr/local/tomcat/webapps/ROOT.war

# Environment variables for PostgreSQL
ENV POSTGRES_DB=ebt522
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=ebt522

# Expose Tomcat default port
EXPOSE 9090

