"""Entrypoint to spin up API server & frontend on local machine for validation"""

import subprocess
import os


def known_vulnerability(user_input):
    subprocess.Popen(user_input, shell=True)


if __name__ == "__main__":

    known_vulnerability("vulnerability")
    # Use Popen() method so that process is not blocking
    api_server = subprocess.Popen(
        [
            ".venv/Scripts/uvicorn",
            "src.api:app",
            "--host",
            "127.0.0.1",
            "--port",
            "8000",
        ],
        shell=False,
    )
    print("Spinning up API Server")

    frontend = subprocess.Popen(
        [".venv/Scripts/streamlit", "run", "src/frontend.py", "--server.port", "8501"],
        shell=False,
    )
    print("Spinning up Frontend")

    try:
        api_server.wait()
        frontend.wait()
    except KeyboardInterrupt:
        api_server.terminate()
        frontend.terminate()
