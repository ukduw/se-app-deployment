# Reverse Proxy
A server that sits in front of web server(s), intercepts client requests, and forwards them to the appropriate backend server.
- Acts as a gateway, improving security by hiding the identity of the origin server(s)
- Improves performance/reliability via load balancing and caching


## Nginx reverse proxy
- `cd /` from root
- `cd etc/nginx/sites-available`
    - Contains `default` conf
``` 
...
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        proxy_pass http://localhost:3000; # ADD THIS LINE
        try_files $uri $uri/ =404;
    }

    ...
...
}

```
- Use `sed` to insert line if automating, e.g.
    - `cd /`
    - `cd etc/nginx/sites-available`
    - `sudo sed -i '48a\        proxy_pass http://localhost:3000;' default`

Typically, create custom conf file for new server block additions instead of editing default directly
- `sudo nano /etc/nginx/sites-available/your_domain`
```
server {
    listen 80;
    listen [::]:80;

    server_name your_domain www.your_domain;

    location / {
        proxy_pass app_server_address;
        include proxy_params;
    }
}
```
- `/etc/nginx/proxy_params`:
```
proxy_set_header Host $http_host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme
```
- The new conf file then needs to be linked to the sites-enabled directory that Nginx reads at startup:
    - `sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/`

