# ---------- Stage 1: Build & run tests ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven descriptor and sources
COPY pom.xml .
COPY src ./src

# Build the project AND run JUnit tests
# If any test fails, the Docker build will fail.
RUN mvn clean verify

# ---------- Stage 2: Run the application ----------
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy the built JAR from the first stage
# calculator-app-1.0.0.jar is produced in target/ by Maven :contentReference[oaicite:1]{index=1}
COPY --from=build /app/target/*.jar app.jar

# Run the main class from inside the JAR
# (Jar doesn't declare Main-Class, so we use -cp + main class)
ENTRYPOINT ["java", "-cp", "app.jar", "com.example.calculator.App"]
