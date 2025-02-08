FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /JavaApp
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
EXPOSE 8080
