#python environment
sudo apt-get install python-pip python-dev
pip install --upgrade pip
sudo pip install setuptools
sudo pip install matplotlib numpy scipy

#latex compiler
sudo apt-get install texlive texlive-fonts-recommended texlive-lang-german texlive-latex-base texlive-latex-extra texlive-latex-recommended lmodern texlive-fonts-recommended

#fuck
read -p "Use thefuck? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	pip install --user thefuck
	echo "eval $(thefuck --alias)" >> ~/.bashrc
else
	echo "alias fuck='sudo \$(history -p \!\!)'" >> ~/.bashrc
fi

#aliases
echo "alias dd='dd status=progress'" >> ~/.bashrc
echo "alias sudo='sudo '" >> ~/.bashrc    #make aliases work with sudo
echo "function transfer { curl --upload-file $1 https://transfer.sh/$1; echo; }" > ~/.bashrc
