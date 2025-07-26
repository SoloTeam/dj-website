#! /bin/bash
sudo apt-get update
sudo apt-get install -y python3-pip git
pip3 install flask

mkdir -p /opt/dj-website
cd /opt/dj-website

# Clone from your GitHub (adjust the repo URL if needed)
git clone https://github.com/YOUR_USERNAME/dj-website.git .

cd app
nohup python3 app.py > /var/log/flask.log 2>&1 &
