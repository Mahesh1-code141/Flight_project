# ---------- Stage 1: Build WAR using Maven ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build WAR file
RUN mvn clean package


# ---------- Stage 2: Run in Tomcat ----------
FROM tomcat:10.1

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from build stage
COPY --from=build /app/target/flight-manufacturing.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD [\"catalina.sh\", \"run\"]
