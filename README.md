# Mac Setup

This project automates the setup of a Macintosh computer using bash scripts. It installs CLI tools, GUI applications, and fonts using Homebrew. The lists of tools, applications, and fonts are read from text files for easy customization.

## Structure
- `install.sh`: Main script to run the setup.
- `cli-tools.txt`: List of CLI tools to install.
- `gui-apps.txt`: List of GUI applications to install.
- `fonts.txt`: List of fonts to install.

## Usage
1. Edit the `cli-tools.txt`, `gui-apps.txt`, and `fonts.txt` files to include your desired software.
2. Run the setup script:
   ```sh
   chmod +x install.sh
   ./install.sh
   ```

## Prerequisites
- macOS
- [Homebrew](https://brew.sh/) (the script will install it if not present) 