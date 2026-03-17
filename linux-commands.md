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
- `mv [filename] [directory/new filename/filepath]` - move/rename files
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

### Environment
- `printenv` - display all environment variables
  - `echo $MYNAME` - print specific env var
- `export` - set environment variable
  - `export MYNAME=ed`
- `unset` - clear an env var
- `nano .bashrc` - to edit `.bashrc` file, as opposed to current-shell-session-only `export`
  - `export MYNAME="ed is persistent now"`
  - `source .bashrc` - reload the `.bashrc` after edits


## Services
### Info
- `systemctl list-timers`
- `systemctl status [service name]`
  - `systemctl is-enabled [service name]`

### Service Management
- `sudo systemctl enable/disable [service name]` enable/disable as service
- `sudo systemctl restart [service name]`
- `sudo systemctl start/stop [service name]` starts/stops service once
- `systemctl daemon-reexec` **restarts entire systemd manager itself**, typically used when upgrading systemd itself or **changing source code of running services**
- `systemctl daemon-reload` **updates unit file changes** (service/timer files) and rebuilds dependency tree **without interrupting running services**


## Processes
- **A program that is loaded into RAM and is currently being processed by the CPU**
  - It may look like many processes are running concurrently
  - But **a single-core CPU can only run one process at a time**
    - (**multi-core can run more than one concurrently**)
  - **Linux is actually quickly switching between running processes**
- There are **two types of processes**
  - **User processes**
  - **System processes**
    - Most running processes are system processes
    - Usually provide no application or interface for the user
    - **Services like**:
      - Web server
      - FTP server
      - File server
      - Print server
      - Logging server

### Process management
- `ps` - lists all currently running processes (Process Status)
  - `ps -A` - show all processes on the system
  - `ps -E` - show environment processes
  - `ps aux` - detailed list (a (all users), u (user-oriented format), x (includes processes without a controlling terminal, like daemons))
- `top`, `htop` - real-time process monitoring (as opposed to static `ps aux`)
  - `Shift+M` - RAM
  - `Shift+P` - CPU
  - `Shift+N` - Most recent
- `kill [options] [PID]` - sends signals to processes (most commonly to terminate them - i.e. just `kill`)
  - Levels:
    - `kill -1` - SIGHUP: Hangup, used to reload
    - `kill -15` - SIGTERM: Graceful termination (default if no flag)
    - `kill -9` - SIGKILL: Force kill, cannot be caught, blocks cleanup
- `sleep` - pause execution for x seconds
  - `sleep 3`, `sleep 5000`, `sleep 7000`, `sleep 9000`...
- `jobs` - list background and suspended jobs
  - `jobs -l` - also shows PIDs of jobs
  

### Breakout of terminal engagement
- `Ctrl+C`
- `Ctrl+Z`
- `q`

