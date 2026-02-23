# Use official Java 17 environment
FROM eclipse-temurin:17-jdk-jammy

# Set our working directory inside the cloud server
WORKDIR /app

# Copy all your backend code into the server
COPY . .

# Give the server permission to run the Gradle builder
RUN chmod +x gradlew

# Build the Spring Boot application
RUN ./gradlew bootJar -x test --no-daemon

# Expose port 8080 (the cloud standard)
EXPOSE 8080

# Start the server
ENTRYPOINT ["sh", "-c", "java -jar build/libs/*.jar"]