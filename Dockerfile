FROM tomcat:10.1

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/flight-manufacturing.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 2008

CMD ["catalina.sh", "run"]
