# ! Starting Bash Script


# Define the path to the .env file
ENV_FILE="../../.env"

# Check if .env file exists and the required variables are set
if [ ! -f $ENV_FILE ] || [ -z "$DISCORD_TOKEN" ] || [ -z "$CLIENT_TOKEN" ] || [ -z "$CODING_LANGUAGE" ]; then
    echo "Running setup..."
    ./setup.bash
fi

# Source the .env file
source $ENV_FILE

# Check the coding language and execute the appropriate command
case $CODING_LANGUAGE in
  rust)
    echo "Starting Rust project..."
   cd ../rust
    ;;
  java)
    echo "Starting Java project..."
     cd ../java
    ;;
  js)
    echo "Starting JavaScript project..."
    # Add your JavaScript start command here
    cd ../js
    ;;
  python)
    echo "Starting Python project..."
    cd ../python
    ;;
  go)
    echo "Starting Go project..."
    cd ../go
    ;;
  lua)
    echo "Starting Lua project..."
    # Add your Lua start command here
    ;;
  ruby)
    echo "Starting Ruby project..."
    # Add your Ruby start command here
    ;;
  kotlin)
    echo "Starting Kotlin project..."
    # Add your Kotlin start command here
    ;;
  ts)
    echo "Starting TypeScript project..."
    # Add your TypeScript start command here
    ;;
  *)
    echo "Invalid language. Please enter a valid language in the .env file."
    ;;
esac