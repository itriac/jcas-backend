FROM openjdk:8u342-slim

ARG version
ENV TZ=Asia/Taipei

# Create work directory
WORKDIR /opt/jcas

COPY . .

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y unzip wget apt-utils nano

RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz -O apache-tomcat-9.0.73.tar.gz && \
    tar -xzf apache-tomcat-9.0.73.tar.gz
COPY jms-${version}.war /opt/jcas/apache-tomcat-9.0.73/webapps/jms.war
RUN unzip /opt/jcas/apache-tomcat-9.0.73/webapps/jms.war -d /opt/jcas/apache-tomcat-9.0.73/webapps/jms

RUN chmod +x run.sh
CMD ["./run.sh"]
