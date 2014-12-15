PotencialAccion
===============

Proyecto de sonificación y visualización de actividad neuro-estética 

Un potencial de acción, también llamado impulso eléctrico, es una onda de descarga eléctrica que viaja a lo largo de 
la membrana celular modificando su distribución de carga eléctrica. Los potenciales de acción se utilizan en el cuerpo 
para llevar información entre unos tejidos y otros, lo que hace que sean una característica microscópica esencial para 
la vida de los seres vivos.

Este proyecto incluye varios programas diseñados para la sonificación y visualización de datos EEG obtenidos a traves
de la diadema epoc. 


emoOscServer
=========

Para correr el emoOscServer es nesesarios instalar Emokit, recomendamos el fork de Thiago Hersan para esto:

https://github.com/thiagohersan/emokit navega hasta la carpeta de python y desde la terminal: 

sudo python setup.py install


Después es necesario instalar varías librerias, para esto se recomienda configurar setuptools, esto lo puedes hacer instalando brew. En la terminal: 

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 

una vez terminada la instalación: 

export PATH=/usr/local/bin:/usr/local/sbin:$PATH


Librerias para OS X
===================

• pyOsc: sudo easy_install pyOsc

• hidapi: brew install hidapi 

• pycrypto: sudo easy_install pycrypto 

• gevent: sudo easy_install gevent 

• cython-hidapi:  https://github.com/gbishop/cython-hidapi 
  (desgarga y python setup-mac.py build / sudo python setup-mac.py install)

• realpath: sudo port install realpath


Tools
=========

- csvtoOsc 
Esta herramienta te permite leer archivos csv, para esto solo tienes que correr la aplicación y seleccionar el archivo que deseas transmitir en formato OSC. 

- potencialServer
El potenciar server corre en conjunto con el emoOscServer, primero te recomendamos correr el programa en processing, depués en la terminal navegar hasta el archivo emoOscServer.py para ejecutarlo 

python emoOscServer.py

NOTA: es importante que edite el archivo y lo actualices con los datos Serial Number: vendor id: y product id: que corresponden a tu kit epoc especifico. 







