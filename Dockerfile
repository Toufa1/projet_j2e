FROM tomcat:latest
LABEL maintainer="fatou"
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
