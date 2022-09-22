FROM maven As build
WORKDIR /opt
COPY . .
RUN mvn clean package 

FROM tomcat
COPY --from=build target/ *.war /usr/local/tomcat/webapps/
