#!/bin/bash

# Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "Error: Go is not installed. Please install Go from https://golang.org/dl/ and try again, or try running 'export PATH=\$PATH:/usr/local/go/bin'."
    exit 1
fi

# Check if Katana is already installed
if command -v katana &> /dev/null; then
    echo "Katana is already installed."
else
    # Install Katana
    echo "Installing Katana..."
    go install github.com/projectdiscovery/katana/v2/cmd/katana@latest

    # Check if installation was successful
    if [ $? -eq 0 ]; then
        echo "Copying Katana to /usr/local/bin..."
        sudo cp "$(go env GOPATH)/bin/katana" /usr/local/bin/
        echo "Katana copied successfully!"
    else
        echo "Error: Katana installation failed."
        exit 1
    fi
fi

# Clone SecretFinder if not already present
if [ ! -d "SecretFinder" ]; then
    echo "Cloning SecretFinder..."
    git clone https://github.com/m4ll0k/SecretFinder.git
else
    echo "SecretFinder already present."
fi

# Install Python dependencies for SecretFinder
echo "Installing Python dependencies for SecretFinder..."
cd SecretFinder
chmod +x *
pip install -r requirements.txt
echo
echo "Installation completed successfully! Carry-on with JS-Snooper..."
