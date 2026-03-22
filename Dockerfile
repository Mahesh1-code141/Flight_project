# ---------- Stage 1: Build WAR ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package


# ---------- Stage 2: Run Spring Boot App ----------
FROM openjdk:17

WORKDIR /app

# Copy built WAR
COPY --from=build /app/target/*.war app.war

# Expose Spring Boot default port
EXPOSE 8082

# Run application
CMD ["java", "-jar", "app.war"]
