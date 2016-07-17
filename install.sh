# Script to set up a MOB SF on Vagrant.

# Install essential packages from Apt

sudo apt-get update -y
sudo apt-get -y upgrade

# Python package

cd ~/Downloads/
wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz
tar -xvf Python-2.7.12.tgz
cd Python-2.7.12
./configure
make
sudo checkinstall

sudo wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py
sudo python ez_setup.py --insecure

# python-setuptools being installed manually
sudo apt-get -y install python-pip
sudo apt-get install -y python-dateutil python-docutils python-feedparser python-gdata python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-psycopg2 python-psutil python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zei
sudo apt-get install -y gcc
sudo apt-get install -y libffi-dev python3-pip
sudo apt-get install -y libssl-dev
sudo apt-get install -Y libtiff4-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
sudo apt-get install -y zlib1g-dev libfreetype6-dev liblcms2-dev
sudo apt-get install -y autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3
sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo apt-get install -y build-essential python-dev


# Git 
sudo apt-get install -y git

# Java 
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get -y upgrade
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer
sudo update-alternatives --config java

# Install Apache2
sudo apt-get install -y apache2
#rm -rf /var/www
#ln -fs /vagrant /var/www
# Mod wsgi 

sudo apt-get install -y libapache2-mod-wsgi

######################### Restart services #########################
sudo service apache2 stop

######################### MOBSF Environment #########################

cd /var/www/
sudo git clone https://github.com/ajinabraham/Mobile-Security-Framework-MobSF.git
cd Mobile-Security-Framework-MobSF

sudo pip install -r requirements.txt --user --upgrade
sudo pip install cffi PISA 
sudo python manage.py migrate
sudo python manage.py runserver 192.168.50.4:80