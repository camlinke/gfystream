sudo apt-get update
sudo apt-get install -y nginx

sudo rm /etc/nginx/sites-available/default
sudo touch /etc/nginx/sites-available/default

sudo cat >> /etc/nginx/sites-available/default <<'EOF'

server {
    listen 8080;

    location / {
        proxy_pass http://localhost:8000;
        proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
    }
}

server {
    listen 80;

    location / {
        proxy_pass http://localhost:8000;
        proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
    }
}

EOF

sudo service nginx restart