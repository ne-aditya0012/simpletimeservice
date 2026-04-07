from datetime import datetime, timezone
from flask import Flask, jsonify, request

app = Flask(__name__)


@app.route("/")
def time_and_ip():
    visitor_ip = request.headers.get("X-Forwarded-For", request.remote_addr)
    visitor_ip = visitor_ip.split(",")[0].strip()

    return jsonify(
        {
            "message" : "Hello particle41! I am Aditya Nimje.",
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "ip": visitor_ip,
        }
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

