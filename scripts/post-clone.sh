#!/bin/bash

# Define the path for the example and generated .env.json files
ENV_EXAMPLE_FILE=".env.example.json"
ENV_FILE=".env.json"

# Copy the example file to create the actual .env.json
cp $ENV_EXAMPLE_FILE $ENV_FILE

# Extract all the placeholders in the format <VARIABLE_NAME> from the template
PLACEHOLDERS=$(grep -oE "<[A-Z_]+>" $ENV_EXAMPLE_FILE)

# Loop through each placeholder and replace it with the corresponding environment variable
for PLACEHOLDER in $PLACEHOLDERS; do
  # Remove the < and > characters to get the variable name
  VAR_NAME=$(echo $PLACEHOLDER | tr -d '<>')

  # Replace the placeholder with the environment variable value
  sed -i '' "s|$PLACEHOLDER|${!VAR_NAME}|g" $ENV_FILE
done

# Setup google-services.json
touch android/app/google-services.json
echo $GOOGLE_SERVICES_FILE > android/app/google-services.json
