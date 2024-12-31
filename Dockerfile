# Base image olarak Tomcat 9 ve Java 11 kullanıyoruz
FROM tomcat:9-jdk11-openjdk

# PostgreSQL bağlantı bilgilerini çevresel değişkenler olarak tanımlıyoruz
ENV POSTGRES_DB=ebt522
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=ebt522

# Tomcat'in server.xml dosyasını lokal sisteminizden Docker imajına kopyalıyoruz
COPY "C:/Users/lokman.sahoglu/Servers/Tomcat v10.1 Server at localhost-config/server.xml" /usr/local/tomcat/conf/server.xml

# Projenizin webapp dosyalarını Tomcat'in ROOT dizinine kopyalıyoruz
COPY ./src/main/webapp /usr/local/tomcat/webapps/ROOT

# Tomcat'in varsayılan portunu expose ediyoruz
EXPOSE 9090

# Tomcat server'ını başlatıyoruz
CMD ["catalina.sh", "run"]

