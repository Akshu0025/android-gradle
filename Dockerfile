# Use the official Android base image
FROM openjdk:8-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the Android application files to the container
COPY app /app

# Install Android SDK and build tools
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip sdk-tools-linux-4333796.zip -d android-sdk && \
    rm sdk-tools-linux-4333796.zip && \
    echo 'y' | android-sdk/tools/bin/sdkmanager "platforms;android-28" "build-tools;28.0.3"

# Set the environment variables for Android SDK
ENV ANDROID_HOME=/app/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Build the Android application
RUN cd /app && \
    ./gradlew assembleDebug

# Expose the port for the Android application
EXPOSE 8080

# Start the Android application
CMD ["./gradlew", "installDebug"]