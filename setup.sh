sudo bash -c 'echo "deb http://labs.picotech.com/debian/ picoscope main" >/etc/apt/sources.list.d/picoscope.list'
sudo apt-get update
sudo apt-get install -y picoscope

sudo apt-get install python-pip python-dev
pip install --upgrade pip
sudo pip install setuptools
sudo pip install matplotlib numpy

sudo apt-get install texlive texlive-fonts-recommended texlive-lang-german texlive-latex-base texlive-latex-extra texlive-latex-recommended lmodern texlive-fonts-recommended
