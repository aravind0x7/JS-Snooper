
# JS-Snooper 🕵️‍♂️
JS-Snooper is a powerful tool designed to hunt for sensitive information hidden within JavaScript files on websites. It automates the process of scanning websites for JavaScript files and identifies potentially sensitive information using pre-written tools Katana and SecretFinder.

## Features

- Automated scanning of websites for JavaScript files
- Detection of sensitive information within JavaScript files
- Easy-to-use command-line interface
- Quick setup with minimal dependencies
- Colorful and pleasant user experience

## Prerequisites

Before using JS-Snooper, make sure you have the following prerequisites installed:

- Go (for Katana)
- Python 3 and pip (for SecretFinder)
- Git (for cloning SecretFinder)

## Installation

Clone the JS-Snooper repository:

```bash
git clone https://github.com/aravind0x7/JS-Snooper.git
cd JS-Snooper
chmod +x *
```

Run the installation script to set up the tool:

```bash
bash requirements.sh

Follow the on-screen instructions to complete the installation. The `requirements.sh` script will install Katana, clone SecretFinder, and install Python dependencies.

## Usage

Once installed, you can use JS-Snooper to scan a website for sensitive information in JavaScript files. Simply run the script and follow the prompts:

```bash
bash js_snooper.sh
```

Follow the on-screen prompts to enter the domain name of the website you want to scan.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/aravind0x7/JS-Snooper/blob/main/LICENSE) file for details.

## Author
Gnana Aravind K ([aravind0x7](www.aravind0x7.in))

## Acknowledgements

- [ProjectDiscovery Katana](https://github.com/projectdiscovery/katana)
- [SecretFinder](https://github.com/m4ll0k/SecretFinder)
```
