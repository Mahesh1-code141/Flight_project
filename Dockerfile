# ---------- Stage 1: Build WAR ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build WAR file
RUN mvn clean package


# ---------- Stage 2: Run Application ----------
FROM openjdk:17

WORKDIR /app

# Copy WAR from build stage
COPY --from=build /app/target/*.war app.war

# Expose port
EXPOSE 8082

# Run Spring Boot app
CMD ["java", "-jar", "app.war"]
