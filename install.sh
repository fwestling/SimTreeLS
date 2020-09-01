# This script should install comma and snark for you

mkdir -p ~/src
mkdir -p ~/build/comma
mkdir -p ~/build/snark

###### First, comma ######
# https://github.com/acfr/comma/wiki/more-details-on-building-from-source
sudo apt-get install build-essential git cmake-curses-gui cmake perl python libboost-all-dev socat

# if you plan to use python modules and applications
sudo apt-get install python-dev python-numpy

cd ~/src/
git clone https://github.com/acfr/comma.git
cd ~/build/comma
# ccmake ~/src/comma
cmake -D BUILD_PYTHON_PACKAGES=ON . && make -j 4 && sudo make install

###### Then, snark ######
# https://github.com/acfr/snark/wiki/Snark-for-dummies,-on-ubuntu-debian
sudo apt-get install libeigen3-dev
sudo apt-get install libtbb-dev
sudo apt-get install zlib1g-dev libbz2-dev

# if you plan to use imaging (for example cv-cat)
sudo apt-get install libopencv-dev libopencv-highgui-dev

sudo apt-get install libqt4-dev
cd ~/src/
git clone https://github.com/acfr/qt3d.git
cd qt3d
sudo /usr/share/qt4/bin/qmake ~/src/qt3d/qt3d.pro
sudo mkdir /usr/include/qt4/Qt3D
sudo mkdir /usr/include/qt4/Qt3DQuick
sudo make -j 4

cd ~/src/
git clone https://github.com/acfr/snark.git
cd ~/build/snark
ccmake ~/src/snark
cmake . && make -j 4 && sudo make install


# And then my dependencies!!
sudo apt install default-jre