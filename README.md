# Installing Presto

~~~ sh
# list all available versions:
$ sh prestolist.sh

# install a Presto:
$ sh prestoinstall.sh 0.147
~~~

# The location of the dirs
default settings as below.

@see prestoenv.conf
~~~
PRST_DIR=/usr/local/opt/presto
PRST_BASE_DIR=/usr/local/opt
ETC_DIR=/usr/local/etc/presto
DATA_DIR=/usr/local/var/presto/data
~~~

# Confirm current version
~~~ sh
$ sh prestoversion.sh
~~~

# How to add catalogs
e.g Hive connector
~~~sh
Create $PRST_DIR/etc/catalog/hive.properties
~~~
## Copyright
    Copyright (c) 2016 yu-yamada
