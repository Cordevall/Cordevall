# ! Setup Bash Script


# Define the path to the .env file
ENV_FILE="../../.env"


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


echo "Please enter your client id:"
read CLIENT_TOKEN

# Save Discord token to .env file
echo "CLIENT_TOKEN=$CLIENT_TOKEN" >> $ENV_FILE

CODING_LANGUAGE=""

# Keep asking for coding language until a valid one is entered
while [[ ! "$CODING_LANGUAGE" =~ ^(rust|java|js|python|go|lua|ruby|kotlin|ts)$ ]]; do
    echo "Please enter your preferred coding language (langrages in readme):"
    read CODING_LANGUAGE
    # If the input is not one of the allowed languages, print an error message
    if [[ ! "$CODING_LANGUAGE" =~ ^(rust|java|js|python|go|lua|ruby|kotlin|ts)$ ]]; then
        echo "Invalid language. Please enter a valid language."
    fi
done

# Save the valid coding language to the .env file
echo "CODING_LANGUAGE=$CODING_LANGUAGE" >> $ENV_FILE

# Define the directory to clone the repository into
CLONE_DIR="/home"

# Define the GitHub repository for each language
case "$CODING_LANGUAGE" in
  rust)
    REPO_URL="https://github.com/your-org/rust-repo.git"
    REPO_NAME="rust-repo"
    ;;
  java)
    REPO_URL="https://github.com/your-org/java-repo.git"
    REPO_NAME="java-repo"
    ;;
  js)
    REPO_URL="https://github.com/your-org/js-repo.git"
    REPO_NAME="js-repo"
    ;;
  python)
    REPO_URL="https://github.com/your-org/python-repo.git"
    REPO_NAME="python-repo"
    ;;
  go)
    REPO_URL="https://github.com/your-org/go-repo.git"
    REPO_NAME="go-repo"
    ;;
  lua)
    REPO_URL="https://github.com/your-org/lua-repo.git"
    REPO_NAME="lua-repo"
    ;;
  ruby)
    REPO_URL="https://github.com/your-org/ruby-repo.git"
    REPO_NAME="ruby-repo"
    ;;
  kotlin)
    REPO_URL="https://github.com/your-org/kotlin-repo.git"
    REPO_NAME="kotlin-repo"
    ;;
  ts)
    REPO_URL="https://github.com/your-org/ts-repo.git"
    REPO_NAME="ts-repo"
    ;;
  *)
    echo "Invalid language. Please enter a valid language."
    exit 1
    ;;
esac

# If the repository already exists, delete it
if [ -d "$CLONE_DIR/$REPO_NAME" ]; then
  rm -rf "$CLONE_DIR/$REPO_NAME"
fi

# Clone the repository
git clone $REPO_URL $CLONE_DIR/$REPO_NAME