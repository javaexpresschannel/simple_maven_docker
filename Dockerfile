FROM openjdk:17-jdk-slim

ADD target/javaexpress-springboot-docker.jar javaexpress-springboot-docker.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","javaexpress-springboot-docker.jar"]