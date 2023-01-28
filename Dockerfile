FROM maven As build
WORKDIR /opt
COPY . /opt
RUN mvn clean package 

FROM tomcat
COPY --from=build /opttarget/*.war /usr/local/tomcat/webapps/
