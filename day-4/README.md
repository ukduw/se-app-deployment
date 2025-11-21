# Custom Linux Images in Cloud
For example, after setting up (mongo)db once, including enabling it so it runs persistently on startup, a custom image of that instance can be made so that a usable/connectable db instance can be created without even having to SSH into it.

**Image = OS, filesystem, software (installed+configured)**

Note: instance has to be stopped before making an image of it


## Monitoring Resources, AWS CloudWatch
Without monitoring:
- CPU load is too high -> fall over

Monitoring:
1. Use service (CloudWatch) to monitor the metric (in this case, CPU load)
    - Put into dashboard (overview)
    - Requires someone to constantly watch
2. Add alarm(s) on metric(s)
    - Will notify user on trigger
3. Autoscaling
    - Automates the fix to the trigger

### Simulating CPU Load
- Use `yes` command to generate stream of output, consuming CPU resources
    - e.g. `yes > /dev/null &` runs `yes` in the background
- `stress` - `sudo apt install stress`
    - `stress -d` - stress the **storage**
    - `stress -c` - stress the **CPU**
    - `stress -v` - stress the **memory**
    - `stress -i` - stress the **IO**
    - `stress -l` - specify load %
    - `stress -t` - timeout period
- e.g. `stress -c 8 -t 10`
    - stress 8 CPU cores with a timeout of 10s
- e.g. `stress -c 1 -l 60`
    - stress 1 CPU core to 60% load
