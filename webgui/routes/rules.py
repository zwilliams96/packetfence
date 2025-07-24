from flask import Blueprint, render_template, request, redirect
from firewall import nftables

bp = Blueprint("rules", __name__, url_prefix="/rules")

@bp.route("/", methods=["GET"])
def view_rules():
    forwards = nftables.get_user_rules("forward")
    inputs = nftables.get_user_rules("input")
    outputs = nftables.get_user_rules("output")
    return render_template("rules.html", forwards=forwards,inputs=inputs,outputs=outputs)

@bp.route("/add", methods=["POST"])
def add_rule():
    rule_text = request.form.get("rule")
    if rule_text:
        nftables.append_rule("forward", rule_text)
        nftables.apply_rules()
    return redirect("/rules")