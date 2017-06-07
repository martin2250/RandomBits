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
echo "function transfer { curl --upload-file \$1 https://transfer.sh/\$1; echo; }" >> ~/.bashrc
echo "alias find='find 2>/dev/null'" >> ~/.bashrc
echo "alias untar='tar -xvzf'" >> ~/.bashrc

#arch
cp /etc/yaourtrc ~/.yaourtrc
echo "BUILD_NOCONFIRM=1" >> ~/.yaourtrc
echo "EDITFILES=0" >> ~/.yaourtrc
echo "MAKEFLAGS=\"-j4\"" >> /etc/makepkg.conf
yaourt -S ttf-humor-sans	#xkcd font

rm -rf ~/.cache/matplotlib	#makes font work with plt.xkcd()


#fixes
echo "options drm_kms_helper poll=N" >> /etc/modprobe.d/local.conf	#improves high cpu load while watching videos
