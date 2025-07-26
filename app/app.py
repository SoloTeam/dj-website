from flask import Flask

# Create the Flask web application
app = Flask(__name__)

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
    app.run(host="0.0.0.0",debug=True)
    #app.run(host="0.0.0.0", port=80, debug=True)