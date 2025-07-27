#! /bin/bash
#log() {
#  echo "$(date '+%Y-%m-%d %H:%M:%S') — $1" >> /var/log/startup-script.log
#}

{
echo "===== STARTUP SCRIPT BEGIN ====="
sudo apt-get update
sudo apt-get install -y python3-pip git

# Clone your GitHub repo
#echo "Cloning repo..."
#mkdir -p /opt/dj-website
#cd /opt/dj-website
#it clone https://github.com/SoloTeam/dj-website.git .

# Clone your GitHub repo
echo "Cloning repo..."
REPO_DIR="/opt/dj-website"
REPO_URL="https://github.com/SoloTeam/dj-website.git"

# Fix to always clone files from repo
rm -rf "$REPO_DIR" # not required if VM recreated with TF
mkdir -p "$REPO_DIR"
git clone "$REPO_URL" "$REPO_DIR"

# Avoid failing if dir already exists
#if [ ! -d ".git" ]; then
#  git clone "$REPO_URL" .
#else
#  echo "Repo already exists. Skipping clone."
#fi

# Install Python package
echo "Installing Python packages..."
cd "$REPO_DIR"
sudo pip3 install -r requirements.txt
#sudo pip3 install flask flask-limiter

 # Run the Flask app
echo "Running Flask app..."
cd "$REPO_DIR/app"
nohup python3 app.py > /var/log/flask.log 2>&1 &

echo "===== STARTUP SCRIPT DONE ====="
} >> /var/log/startup-script.log 2>&1