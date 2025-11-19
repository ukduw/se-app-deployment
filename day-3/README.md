# Deploying Databases to Cloud





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