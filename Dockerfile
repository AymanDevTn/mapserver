# Use OpenJDK 11 as the base image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file
COPY target/map-server-1.0-SNAPSHOT.jar app.jar

# Copy the application.properties file
COPY src/main/resources/application.properties ./config/application.properties

# Expose the application port
EXPOSE 8081

# Set environment variables if needed (uncomment and edit as required)
# ENV SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/mapSERVER
# ENV SPRING_DATASOURCE_USERNAME=postgres
# ENV SPRING_DATASOURCE_PASSWORD=P@ssw0rd

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar", "--spring.config.location=file:./config/application.properties"] 