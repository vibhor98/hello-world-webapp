FROM openjdk:8
WORKDIR /usr/src/app
COPY target/hello-world-webapp.jar /usr/src/app/
CMD "java -jar /usr/src/app/hello-world-webapp.jar"
