
from fastapi.testclient import TestClient
from fastapi import FastAPI

app = FastAPI()

client = TestClient(app)

@app.get("/")
def home ():
    return {
        "message": "On home route!"
    }


def test_root () :
    response = client.get("/")
    