"""Entrypoint to spin up API server & frontend on local machine for validation"""

import subprocess

if __name__ == "__main__":

    # Use Popen() method so that process is not blocking
    api_server = subprocess.Popen(
        ["uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8000"]
    )
    print("Spinning up API Server")

    frontend = subprocess.Popen(
        ["streamlit", "run", "src/frontend.py", "--server.port", "8501"]
    )
    print("Spinning up Frontend")

    try:
        api_server.wait()
        frontend.wait()
    except KeyboardInterrupt:
        api_server.terminate()
        frontend.terminate()
