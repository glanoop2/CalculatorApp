# Stage 1: Build with Maven and run tests
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build and run tests
RUN mvn clean verify

# Stage 2: Run the app
FROM eclipse-temurin:17-jdk
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

# Run the main class from the JAR
ENTRYPOINT ["java", "-cp", "app.jar", "com.example.calculator.App"]
