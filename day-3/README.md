# Deploying Databases to Cloud
**Dual stack/two-tier** is when 2 instances in a server are connected - a web server and a database, in this case.
- Multiple web servers can be connected to a single database

This is opposed to a **monolith**, where the same instance hosts both - this risks both going down at the same time.

The **post page** pulls data from the connected database to the web server.


## Databases
**MongoDB** is the most popular **non-relational**, **noSQL database**. It **stores data as documents**.

placeholder
- placeholder
- 


---
---
NOTE: running a script with `source` means you can run it without having to `chmod +x` it
- e.g. `source deploy-app.sh`

Another good practice is to use `echo "message here"` in bash scripts to log progress