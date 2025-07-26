#! /bin/bash
sudo apt-get update
sudo apt-get install -y python3-pip git
sudo pip3 install flask

echo "Cloning repo..."
mkdir -p /opt/dj-website
cd /opt/dj-website

# Clone from your GitHub (adjust the repo URL if needed)
git clone https://github.com/SoloTeam/dj-website.git .

cd app
echo "Running Flask app..."
# Modify app.py to bind to all interfaces on port 5000
# sed -i 's/app.run(/app.run(host="0.0.0.0", /' app.py

nohup python3 app.py > /var/log/flask.log 2>&1 &
echo "===== STARTUP SCRIPT DONE ====="

} >> /var/log/startup-script.log 2>&1