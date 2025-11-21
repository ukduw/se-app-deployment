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


### Long-running vs One-off services
- `docker-compose up` is intended for long-running services
    - e.g. 24/7 bot, Jellyfin, QuakeJS...
    - `-d` flag = detached mode - runs container in the background
- `docker run --rm` is for **systemd-scheduled, one-off jobs**
    - e.g. `docker run --rm script-image`
    - `--rm` removes the container afterward


### Docker Images
Docker cannot run a script directly.   

Docker runs **images** (containers built from images). You need:
1. Docker image containing script, **OR**
2. A base image (e.g. python:3.12) with the script mounted into it and executed with a command...

Two files: dockerfile + bot.py

Run `docker build -t bot-image .`

Now systemd can run `docker run --rm bot-image`



### Docker Compose
- `docker` alone is just basic commads like:
    - `docker run`
    - `docker stop`
    - `docker logs`
- **Docker Compose uses YAML files**
    1. Which containers to run
    2. Which images to use
    3. What volumes to mount
    4. What ports to expose
    5. How/If they should restart
    6. Environment variables, networks...
    - run with `docker compose up -d`
- **Example file structure**:
    ```
    /srv/   ("service data")
      media-stack/      (cd here)
        docker-compose.yml
        jellyfin/
        quakejs/
    ```
- **Persistent services**
    - Inside `docker-compose.yml`:
        - `restart: unless-stopped`
    - Will always auto-start itself unless user manually stops it
        - `docker stop containername`
    - **NO SYSTEMD NEEDED**



### Personal Scenario
Let's say the setup is:
- Trading bot 1 (24/7, persistent)
- Trading bot 2 (14/5, systemd-scheduled)
- Screener (systemd-scheduled)
- Semi-automated TA (systemd-scheduled)
    - The former 2 and latter 2 need shared directories/files
- Jellyfin
- ...

**Example file structure**

    ```
    /srv/
      trading/
        shared-data/
          ... .json
          ... .json
          ... .csv
          ... .txt
        bot1/
          Dockerfile
          requirements.txt
          bot1.py
          ...
        bot2/
          Dockerfile
          requirements.txt
          bot2.py
          ...
        other-scripts/
          screener/
            Dockerfile
            screener.py
            ...
          TA/
            Dockerfile
            TA.py
            ...

      media-stack/
        docker-compose.yaml
        jellyfin/
          config/
          cache/
        .../
        
      systemd-services/
        bot2.service
        bot2.timer
        screener.service
        screener.timer
        TA.service
        TA.timer
    ```

**Shared data mounting example**
- Refer to systemd .service example
- Inside the bot2.py:

```
import json
with open("/shared-data/filename.json") as f:
     data = json.load(f)
```

