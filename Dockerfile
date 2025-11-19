# ---- Stage 1: Build the project using Maven ----
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Run tests and package
RUN mvn clean package

# ---- Stage 2: Run the application ----
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy the final JAR from stage 1
COPY --from=build /app/target/*.jar app.jar

# Run the Java JAR
ENTRYPOINT ["java", "-jar", "app.jar"]

