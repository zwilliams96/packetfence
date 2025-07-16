from flask import Blueprint, render_template, request, redirect
from firewall import nftables

bp = Blueprint("rules", __name__, url_prefix="/rules")

@bp.route("/", methods=["GET"])
def view_rules():
    rules = nftables.get_user_rules("forward")
    return render_template("rules.html", rules=rules)

@bp.route("/add", methods=["POST"])
def add_rule():
    rule_text = request.form.get("rule")
    if rule_text:
        nftables.append_rule("forward", rule_text)
        nftables.apply_rules()
    return redirect("/rules")