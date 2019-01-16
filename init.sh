#!/bin/sh

# Simple example shell script which demonstrates
# how to use the PDFDoclet with javadoc directly
# (which means: without ANT).

# Set the JAVA_HOME variable correctly !!
JAVA_HOME=~/jdk

PATH=$JAVA_HOME/bin

VERSION=1.0.3

DOCLET=com.tarsec.javadoc.pdfdoclet.PDFDoclet
JARS=jar/pdfdoclet-$VERSION-all.jar
RESULT=pdf/res.pdf
CONFIG=config_html.properties
SOURCEPATH=~/jdk/src
PACKAGES=""
# Paquetes para poder imprimar (Si imprimo lo siguiente, me muero)
#PACKAGES="$PACKAGES java.math"
PACKAGES="$PACKAGES java.rmi java.rmi.registry java.rmi.server"
PACKAGES="$PACKAGES java.util.concurrent java.util.concurrent.atomic java.util.concurrent.locks"
#PACKAGES="$PACKAGES java.util.regex"

# Paquetes para la asignatura pctr.
#PACKAGES="$PACKAGES java.io java.math java.net java.rmi java.rmi.activation java.rmi.dgc java.rmi.registry"
#PACKAGES="$PACKAGES java.rmi.server java.time java.util java.util.concurrent java.util.concurrent.atomic"
#PACKAGES="$PACKAGES java.util.locks java.util.logging java.util.regex java.util.spi java.util.stream"

# Paquetes para obtener toda la api de java en general.
#PACKAGES="$PACKAGES java.applet java.beans java.io java.math java.net java.nio java.rmi java.rmi.activation"
#PACKAGES="$PACKAGES java.rmi.dgc java.rmi.registry java.rmi.server java.security java.text java.time java.time.chrono"
#PACKAGES="$PACKAGES java.time.format java.time.temporal java.time.zone java.util java.util.concurrent java.util.concurrent.atomic"
#PACKAGES="$PACKAGES java.util.concurrent.locks java.util.function java.util.jar java.util.logging java.util.prefs"
#PACKAGES="$PACKAGES java.util.regex java.util.spi java.util.stream java.util.zip"
#PACKAGES="$PACKAGES java.lang.annotation java.lang.instrument java.lang.invoke java.lang.management java.lang.ref java.lang.reflect"

export JAVA_HOME PATH DOCLET JARS PACKAGES RESULT CONFIG SOURCEPATH

javadoc -doclet $DOCLET -docletpath $JARS -pdf $RESULT -config $CONFIG -private -sourcepath $SOURCEPATH $PACKAGES
