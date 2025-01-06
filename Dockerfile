# Tomcat tabanlı bir imaj kullanıyoruz
FROM tomcat:9-jdk11-openjdk

# PostgreSQL bağlantısı için çevre değişkenleri
ENV POSTGRES_DB=ebt522
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=ebt522
ENV POSTGRES_HOST=your-postgresql-host
ENV POSTGRES_PORT=5432

# Tomcat server.xml dosyasını kopyalıyoruz
COPY ./src/main/resources/server.xml /usr/local/tomcat/conf/server.xml

# JSP ve statik dosyaları Tomcat ROOT dizinine kopyalıyoruz
COPY ./src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# Tomcat portunu expose ediyoruz
EXPOSE 9090

# Tomcat başlatma komutu
CMD ["catalina.sh", "run"]
