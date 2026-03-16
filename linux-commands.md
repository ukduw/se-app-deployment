# Basic Linux Commands
- `sudo apt update -y && sudo apt upgrade`
  - Update package sources, upgrade packages
- `sudo apt install [package]`
- `sudo` run as superuser
  - `su` switch user - used with sudo
  - `exit` logout

## Linux System info
- `uname` - Show OS name
  - `uname -a` - Detailed OS info
- `whoami` - Show current user
- `pwd` - Print working directory
- `ps` - Show running processes

## Shell Utilities
- `history` - Show command history
  - `history -c` - Clear command history

## File Downloading
- `curl [URL]` 
  - `curl [URL] --output [filename]`
- `wget [option] [URL]`
  - `wget -O [filename] [URL]`
  - `wget -c` resume downloading partially downloaded file


## Files
### File manipulation
- `mkdir` - make directory
- `mv [filename] [directory/new filename]` - move/rename files
- `rm` - remove file
  - `rm -r` - remove directory recursively
  - `rm -d` - remove empty directory
- `touch` - create empty file
- `cp` - copy files

### Navigation
- `ls` - list files/directories
  - `ls -a` - all
  - `ls -l` - detailed, including permissions
- `tree` - print directory structure
- `cd` - change directory

### File contents
- `nano` - text editor
- `cat` - print file contents
  - `head` - print top lines of file contents
  - `tail` - print bottom lines of file contents
  - `nl` - prints lines with line count
- `grep` - search keywords in files
  - `grep "string" [filename]`
  - `grep -i -r "string" *` recursively search all directories, ignoring case sensitivity
  - `-c` count lines where string matches
  - Can also be used with REGEX
    - ^ beginning of line
    - $ end of line
    - "." any character
    - [a-z] any characters between a and z
    - [^...] any character not in these brackets
  - grep is often used with piping (some output is piped to grep to be filtered)
    - e.g. `ifconfig | grep -A 4 ens3`
      - Runs `ifconfig`
      - Output piped to `grep` - `|`
      - `-A 4` will display 4 lines that come after the search string (`-B` for before)

### File info
- `file` - file type

### Permissions
- `chown [new owner][:optional new group] [filename]`
  - e.g. `chown root:root usr/bin/sudo`
- `chmod [permissions] [filename]`
  - `+rwx` read, write, execute
    - e.g. `chmod +x bash_script.sh` 
  - `777` 4 read, 2 write, 1 execute - User, Group, Others
    - e.g. `400` read-only for user, no permissions for everyone else


## Services
### Info
- `systemctl list-timers`
- `systemctl status [service name]`
  - `systemctl is-enabled [service name]`

### Service Management
- `sudo systemctl enable/disable [service name]` enable/disable as service
- `sudo systemctl restart [service name]`
- `sudo systemctl start/stop [service name]` starts/stops service once
- 