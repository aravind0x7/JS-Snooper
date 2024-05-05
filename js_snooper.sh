#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to display the tool banner
display_banner() {
    # Color codes
    echo -e "${RED}######################################################################${NC}"
    echo -e "${RED}#${NC}      ${YELLOW}_  ____         ____                                          ${RED}#${NC}"
    echo -e "${RED}#${NC}     ${YELLOW}| |/ ___|       / ___|  _ __    ___    ___   _ __    ___  _ __ ${RED}#${NC}"
    echo -e "${RED}#${NC}  ${YELLOW}_  | |\___ \  _____\___ \ | '_ \  / _ \  / _ \ | '_ \  / _ \| '__|${RED}#${NC}"
    echo -e "${RED}#${NC} ${YELLOW}| |_| | ___) ||_____|___) || | | || (_) || (_) || |_) ||  __/| |   ${RED}#${NC}"
    echo -e "${RED}#${NC}  ${YELLOW}\___/ |____/       |____/ |_| |_| \___/  \___/ | .__/  \___||_|   ${RED}#${NC}"
    echo -e "${RED}#${NC}                                                 ${YELLOW}|_|                ${RED}#${NC}"
    echo -e "${RED}######################################################################${NC}"
    echo -e "${YELLOW}                Author: aravind0x7 - www.aravind0x7.in${NC}"
    echo
    echo -e "${GREEN}Welcome to the JS-Snooper! Your bloodhound for hidden info in those JS files.${NC}"
    echo
}

# Function to display usage information
display_usage() {
    echo -e "${GREEN}Usage:${NC}"
    echo "  bash js_snooper.sh <domain>"
    echo
    echo -e "${GREEN}Example:${NC}"
    echo "  bash js_snooper.sh example.com"
    echo
}

# Function to check prerequisites
check_prerequisites() {
    # Check if Katana is installed
    if ! command -v katana &> /dev/null; then
        echo -e "${YELLOW}Katana is not installed. Please install it from https://github.com/projectdiscovery/katana and try again.${NC}"
        exit 1
    fi

    # Check if SecretFinder is installed
    if [ ! -d "SecretFinder" ]; then
        echo -e "${YELLOW}SecretFinder directory not found. Please clone SecretFinder from https://github.com/m4ll0k/SecretFinder and try again.${NC}"
        exit 1
    fi
}

# Function to run Katana and save output to a text file
run_katana() {
    domain="$1"
    echo -e "${GREEN}Running Katana on $domain...${NC}"
    mkdir -p "$domain"
    katana -list "$domain" -d 5 -jc | grep ".js$"  | uniq | sort -o "$domain/js.txt"
    echo -e "${GREEN}Katana finished. Results saved to $domain/js.txt${NC}"
}

# Function to run SecretFinder on the output file produced by Katana
run_secretfinder() {
    domain="$1"
    echo -e "${GREEN}Running SecretFinder on JS files...${NC}"
    
    # Check if the file exists
    if [ ! -f "$domain/js.txt" ]; then
        echo -e "${YELLOW}File $domain/js.txt not found.${NC}"
        exit 1
    fi
    
    # Run SecretFinder on each URL in the file
    cat "$domain/js.txt" | while read -r url; do
        python3 SecretFinder/SecretFinder.py -i "$url" -o cli
    done
}

# Main script

# Display banner
display_banner

# Display usage information
display_usage

# Check prerequisites
check_prerequisites

# Prompt for the domain name
if [ -z "$1" ]; then
    read -p "Enter the domain name: " domain
    echo
else
    domain="$1"
    echo
fi

# Run Katana
run_katana "$domain"

# Run SecretFinder
run_secretfinder "$domain"
