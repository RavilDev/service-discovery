FROM maven:3.9.9-amazoncorretto-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:21
WORKDIR /app
COPY --from=build /app/target/service-discovery-0.0.1-SNAPSHOT.jar app.jar
EXPOSE  8761
ENTRYPOINT ["java", "-jar", "/app/app.jar"]