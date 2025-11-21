# Docker
Packages apps into **containers - lightweight, isolated environments**.
- Each runs its **own processes**
- **Share the host kernel**, so much more lightweight than VMs

Containerization allows multiple apps to run on one machine without interference, different dependency versions, etc...

**One container, one service**
- Containerize each process rather than running some on host.
- Files and directories in host system, and mount shared directories on relevant containers.

**Files are permanent, containers are temporary**


### Systemd
**Docker itself is managed by systemd**
- `sudo systemctl enable docker`
    - Directly enabled without .timer = persistent service

Docker (typically) does not use systemd INSIDE containers.
- **Starting a container = starting a service**
- Docker (typically) launches **a single process**
    - This is PID 1 inside the container - **is *is* the service**
    - **When PID 1 stops, the container stops**
- So, **systemd can be used to schedule containers themselves**, which then each run their own process

**Structure**:   
1. Write systemd timers to schedule docker containers
2. Containers each run their own process
3. Either:
    1. Script naturally comes to an end - container closes
    2. Script has datetime logic that ends it at a specified time - container closes
    - DO NOT write a separate systemd timer to force-close a container (unless to enforce a hard cutoff time)




### Personal Scenarios

