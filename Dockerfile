# Base image
FROM tomcat:9-jdk11-openjdk

# Add application files to the container
COPY ./src/main/webapp /usr/local/tomcat/webapps/ROOT

# Environment variables for PostgreSQL
ENV POSTGRES_DB=ebt522
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=ebt522

# Expose Tomcat default port
EXPOSE 8080
