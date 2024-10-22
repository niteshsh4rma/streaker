# Create .env file
touch .env

# Setup google-services.json
touch android/app/google-services.json
echo $GOOGLE_SERVICES_FILE >> android/app/google-services.json

# Setup environment variables from .env.json by using --dart-define-from-file
touch .env.json

echo \
"{
    \"APPWRITE_ENDPOINT\"=\"$APPWRITE_ENDPOINT\",
    \"APPWRITE_PROJECT\"=\"$APPWRITE_PROJECT\",
    \"FIREBASE_API_KEY\"=\"$FIREBASE_API_KEY\",
    \"FIREBASE_APP_ID\"=\"$FIREBASE_APP_ID\",
    \"FIREBASE_MESSAGING_SENDER_ID\"=\"$FIREBASE_MESSAGING_SENDER_ID\",
    \"FIREBASE_PROJECT_ID\"=\"$FIREBASE_PROJECT_ID\",
    \"FIREBASE_STORAGE_BUCKET\"=\"$FIREBASE_STORAGE_BUCKET\"
}" >> .env.json
