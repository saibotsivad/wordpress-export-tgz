# wordpress-export-tgz

Bash script to export a wordpress install to a tarred, gzipped file.

## how to install

If you have `git` installed, just do:

```bash
git clone https://github.com/saibotsivad/wordpress-export-tgz.git
```

## how to use

You'll need to create a file that looks like this:

```bash
#!/bin/bash
DB_NAME="value from config.php file"
DB_USER="value from config.php file"
DB_PASSWORD="value from config.php file"
DB_HOST="value from config.php file"
WORDPRESS_FOLDER="/path/to/site.com"
```

That file will be your configuration file.

Inside the cloned repo, there's a bash script called `export.sh`
that you run like this:

```bash
./export.sh $CONFIGURATION_FILE $OUTPUT_FILENAME
```

For example:

```bash
NOW=$(date +"%Y-%m-%d-%H%M")
./export /var/www/mysite.com /tmp/mysite_com-$NOW.tgz
```

## dependencies

This bash script relies on the following nearly-universal commands:

* `tar`
* `date`
* `mysqldump`

## license

Published and release under the [Very Open License](http://veryopenlicense.com).
