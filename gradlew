#!/bin/bash

# This is the Gradle wrapper script for Unix-based systems.

DIR=$(dirname "$0")
cd "$DIR"

./gradlew "$@"
