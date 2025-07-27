#! /bin/bash
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

mkdir -p "$REPO_DIR"
cd "$REPO_DIR"


# Avoid failing if already cloned (e.g. on redeploy)
#if [ ! -d ".git" ]; then
#  git clone https://github.com/SoloTeam/dj-website.git .
#else
#  echo "Repo already exists. Skipping clone."
#fi

# Avoid re-cloning if already exists
if [ ! -d ".git" ]; then
  git clone "$REPO_URL" .
else
  echo "Repo already exists. Skipping clone."
fi

# Install Python package
echo "Installing Python packages..."
sudo pip3 install -r requirements.txt

#sudo pip3 install flask flask-limiter
#pip3 install -r requirements.txt

 # Run the Flask app
echo "Running Flask app..."
cd app
nohup python3 app.py > /var/log/flask.log 2>&1 &
echo "===== STARTUP SCRIPT DONE ====="

} >> /var/log/startup-script.log 2>&1