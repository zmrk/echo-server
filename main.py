from flask import Flask, request

app = Flask(__name__)


# 모든 경로를 처리하도록 설정
@app.route(
    "/",
    defaults={"path": ""},
    methods=["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS", "HEAD"],
)
@app.route(
    "/<path:path>", methods=["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS", "HEAD"]
)
def echo(path):
    data = request.get_data(as_text=True)
    return {"url": request.url, "method": request.method, "data": data, "path": path}


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9000)
