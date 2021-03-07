sudo apt install gcc-arm-linux-gnueabi
sudo apt install qemu
sudo apt install gdb-multiarch

sudo apt install python-pip
pip install --upgrade pip

python -m pip uninstall pip
apt remove python-pip
whereis pip

wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
sudo python3 /tmp/get-pip.py
pip install --user pipenv
pip3 install --user pipenv
echo "PATH=$HOME/.local/bin:$PATH" >> ~/.profile
source ~/.profile
whereis pip

sudo pip install gdbgui==0.13.0.0




