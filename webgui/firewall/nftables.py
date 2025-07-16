import os

def get_user_rules(chain):
    path = f"/opt/packetfence/firewall/rules/user_{chain}.nft"
    if not os.path.exists(path):
        return []
    with open(path) as f:
        return f.read().splitlines()

def append_rule(chain, rule_text):
    path = f"/opt/packetfence/firewall/rules/user_{chain}.nft"
    with open(path, "a") as f:
        f.write(rule_text + "\n")

def apply_rules():
    os.system("/opt/packetfence/firewall/rules/apply_rules.sh")