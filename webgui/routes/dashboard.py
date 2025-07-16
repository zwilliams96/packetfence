from flask import Blueprint, render_template
import os

bp = Blueprint("dashboard", __name__, url_prefix="/")

@bp.route("/")
def index():
    hostname = os.uname().nodename
    return render_template("dashboard.html", hostname=hostname)
