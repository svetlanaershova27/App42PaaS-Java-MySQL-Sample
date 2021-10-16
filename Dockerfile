FROM maven:3.6.0-jdk-7-alpine as built
WORKDIR /tmp/
COPY src ./src
COPY pom.xml .
RUN mvn clean package
FROM tomcat:latest
COPY --from=built /tmp/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war
EXPOSE 8080