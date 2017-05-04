#!/bin/bash

CONFIGURATION_FILE=$1
OUTPUT_FILE=$2
NOW=$(date +"%Y-%m-%d-%H%M%S")
TEMP_FOLDER=/tmp/wordpress-export-tgz-$NOW

mkdir -p $TEMP_FOLDER
source $CONFIGURATION_FILE

echo "Starting export of $WORDPRESS_FOLDER"
echo "Temporary folder: $TEMP_FOLDER"

echo "Making backup of WordPress folder..."
tar -cvf $TEMP_FOLDER/export.tar $WORDPRESS_FOLDER

echo "Exporting database..."
mysqldump -u$DB_USER -p$DB_PASSWORD -h $DB_HOST $DB_NAME > $TEMP_FOLDER/database.sql
tar --append --file=$TEMP_FOLDER/export.tgz $TEMP_FOLDER/database.sql
rm $TEMP_FOLDER/database.sql

echo "Compressing file..."
tar -9  $TEMP_FOLDER/export.tar
# results in a file $TEMP_FOLDER/export.tgz

echo "Moving file..."
mv $TEMP_FOLDER/export.tgz $OUTPUT_FILE
rm -rf $TEMP_FOLDER
