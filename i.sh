sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9 python3.9-venv python3.9-dev
python3.9 -m venv 3.9
source 3.9/bin/activate
pip install --upgrade pip
pip install infercode==0.0.31
pip install tensorflow==2.5.0
pip install typing-extensions --upgrade
infercode test.py
