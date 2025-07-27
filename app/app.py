from flask import Flask
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

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

# Run the app on localhost with debug mode
if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)