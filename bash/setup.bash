
# Define the path to the .env file
ENV_FILE="../.env"

# Check if .env file exists
if [ ! -f $ENV_FILE ]; then
    # If not, create and touch it
    touch $ENV_FILE
else
    # If it exists, clear it
    > $ENV_FILE
fi

# Ask for Discord token
echo "Please enter your Discord token:"
read DISCORD_TOKEN

# Save Discord token to .env file
echo "DISCORD_TOKEN=$DISCORD_TOKEN" >> $ENV_FILE

CODING_LANGUAGE=""

# Keep asking for coding language until a valid one is entered
while [[ ! "$CODING_LANGUAGE" =~ ^(rust|java|js|python|go|lua|ruby)$ ]]; do
    echo "Please enter your preferred coding language (rust, java, js, python, go, lua, ruby):"
    read CODING_LANGUAGE
    # If the input is not one of the allowed languages, print an error message
    if [[ ! "$CODING_LANGUAGE" =~ ^(rust|java|js|python|go|lua|ruby)$ ]]; then
        echo "Invalid language. Please enter a valid language."
    fi
done

# Save the valid coding language to the .env file
echo "CODING_LANGUAGE=$CODING_LANGUAGE" >> $ENV_FILE