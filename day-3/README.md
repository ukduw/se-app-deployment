# Deploying Databases to Cloud
- `sudo apt update -y && sudo apt upgrade -y`
- `sudo apt install gnupg -y` (needed to work with **GPG keys**) (in case distro doesn't have it by default)
- `sudo apt install curl -y` (in case...)
- `curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor` (multi-line)
- `echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list` (creates sources list file; configures how to install mongodb)
- `sudo apt install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6` (mongodb packages; note `-y` is in front of list of packages, applying to all)
- `mongod --version` to check

https://www.mongodb.com/docs/v7.0/tutorial/install-mongodb-on-ubuntu/

#### Mysql 8 deploy docs
https://documentation.ubuntu.com/server/how-to/databases/install-mysql/

#### WordPress docs
https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview


### Configure, Start DB
- `cd /etc`
- `sudo nano mongod.conf`
- Change `bindIp: 127.0.0.1` to `0.0.0.0`
    - Would usually change it to specific IP of web app
- `cd` (no argument = home directory)
- `sudo systemctl start mongod`
- `sudo systemctl status mongod` to check

### Connecting DB to Web Server/App
In web server/app instance:
- `export DB_HOST=mongodb://DBIPADDRESS:27017/posts` (set environment variable)
    - e.g. `export DB_HOST=mongodb://54.75.59.107:27017/posts`
- `printenv` or `printenv DB_HOST` to check
- `node seeds/seed.js` (seed the database)
- `pm2 start app.js` (accessible on http://WEBSERVERIPADDRESS/posts)

NOTE: **env variable not persistent** when you use export
- For **persistence, edit the** `/etc/environment` **file**, adding the new var
- Need to log out and in for changes to take effect
- Stay logged in and only apply to systemd services (reliable for daemons, not GUI sessions):
    - `sudo systemctl daemon-reload`
    - `sudo systemctl restart SERVICENAME`


## Databases
**MongoDB** is the most popular **non-relational**, **noSQL database**. It **stores data as documents**.
- `27017` default port for `mongod`, `mongos`
    - Can change with `port`, `--port`
    - Not a huge security gain, but people know the default port
    - Also for if you run multiple DBs

**Dual stack/two-tier** is when 2 instances in a server are connected - a web server and a database, in this case.
- Multiple web servers can be connected to a single database

This is opposed to a **monolith**, where the same instance hosts both - this risks both going down at the same time.

The **post page** pulls data from the connected database to the web server.


---
---
NOTE: running a script with `source` means you can run it without having to `chmod +x` it
- e.g. `source deploy-app.sh`

Another good practice is to use `echo "message here"` in bash scripts to log progress


Protocols:
- TCP (**resend until success**, accuracy)
- UDP (**live**, speed)

**GPG key pairs** ensure your download is not tampered with
- Verifies software package authenticity/integrity before installation