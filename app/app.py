from flask import Flask, render_template
import os

app = Flask(__name__)
APP_VERSION = os.getenv("APP_VERSION","1.0.1")
ENVIRONMENT = os.getenv("ENVIRONMENT","Development")

@app.route("/",)
def home():
    return render_template(
    'index.html',
    version=APP_VERSION,
    environment=ENVIRONMENT
)
@app.route("/health",)
def health():
    return {"status": "healthy"}, 200

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)




