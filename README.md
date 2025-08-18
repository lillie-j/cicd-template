# Respository Template for Python
This service is a basic template for Python applications..

# Author
James Riley : james.riley@capgemini.com

# Default Files / directories
- **src/** - This directory stores all of the python code (except for app.py).
- **.flake8** - Configuration for flake8 linter. This helps control what rules you want applied to checking the style of your python code. E.g. Max line length.
- **app.py** - This is the initialisng file of the whole application. It is standard for the starting file of your application to be named app.py or main.py.
- **environment.yml** - This should contain the configuration for creating an anaconda environment used for local development. 
Exampled command in the terminal
```bash
$ conda create --name python-virtual-env-demo python=3.9.0
```
- **LICESNE** - Standard license that explains the terms and conditions of using this application.
- **README.md** - Documentation about the application, what is does, how to run it and what the dependencies are.
- **requirements.txt** - Python packages with version numbers that the application relies on. E.g.
```py
pandas==2.0.1
flask=2.3.3
```
