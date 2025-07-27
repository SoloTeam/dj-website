from flask import Flask
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
import sys

# Create the Flask web application
app = Flask(__name__)

# Initialize Flask-Limiter
limiter = Limiter(
    get_remote_address,
    app=app,
    default_limits=["50 per hour", "5 per minute", "2 per second"]
)

# Define what happens when someone visits the home page ("/")
@app.route('/')
def home():
    return '''
        <h1>🎧 DJ Ti Solo</h1>
        <p>Welcome to my official DJ portfolio website.</p>
        <p>More beats, mixes, and good vibes coming soon!</p>
    '''

# Run the app with the port passed from startup-script.sh
if __name__ == '__main__':
    # Get the port from command-line argument, or default to 5000
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 5000
    app.run(host="0.0.0.0", port=port, debug=True, use_reloader=False)