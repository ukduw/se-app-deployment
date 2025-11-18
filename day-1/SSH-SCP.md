## SSH - Secure Shell
- Uses **key pair**
    - 2 files - **private key, public key**
    - Key and lock
    - Set of security credentials that you use to prove your identity when connecting to an instance
- Encrypted - only with key pair can you "unscramble"/decrypt messages

misc
- Port 22 standard
- SSH uses TCP protocol
- Can set it so only certain IP addresses are allowed
    - 0 in an IP address is a wildcard

ran after ssh:
- `sudo apt update -y && sudo apt upgrade -y`
- `sudo apt install nginx -y`
- `sudo systemctl status nginx`

## SCP - Secure Copy Protocol
- `scp /path/to/local/file username@hostname:/path/to/remote/directory`

**For AWS EC2 instance**:
- `scp -i /path/to/key.pem /path/to/local/script.sh ubuntu@ec2-public-ip:/home/ubuntu/`

SSH into server after to check it's there 
 
In case executable permissions need to be added, use:
- `chmod +x script.sh`
- `ls -l script.sh` to check

**NOTE: use -r flag to copy a DIRECTORY**
- **Recursive copy**
- e.g. `scp -i /path/to/key.pem -r /path/to/local/script.sh ubuntu@ec2-public-ip:/home/ubuntu/`