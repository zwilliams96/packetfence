from flask import Flask
from routes.dashboard import bp as dashboard_bp
from routes.rules import bp as rules_bp

app = Flask(__name__)

# Register blueprints
app.register_blueprint(dashboard_bp)
app.register_blueprint(rules_bp)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)