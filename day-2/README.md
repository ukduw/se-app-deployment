# Deploying Applications to Cloud
Do it manually, then automate via script

- Note: shebang tells OS what interpreter to use
- Remember to make scripts executable
    - `chmod +x script.sh`
    - `ls -l script.sh`
- `./script.sh`

## Deploy commands
- `sudo apt update -y && sudo apt upgrade -y`
- `sudo apt install unzip -y`
- `sudo unzip nodejs20-se-test-app-2025.zip`
    - If scripting, `scp` command cannot be scripted, so `git clone` the unzipped directory instead
- `sudo apt install nginx -y`
    - `sudo systemctl status nginx` to check
- `sudo bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"` downloads specific 20.x version of nodejs via curl
- `sudo apt install nodejs -y`
    - `node -v` to check nodejs version




