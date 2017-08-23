#!/usr/bin/env bash

KG_USER=
KG_PASSWORD=

kg download -u $KG_USER -p $KG_PASSWORD -c "galaxy-zoo-the-galaxy-challenge" -f "images_test_rev1.zip"
kg download -u $KG_USER -p $KG_PASSWORD -c "galaxy-zoo-the-galaxy-challenge" -f "images_training_rev1.zip"
kg download -u $KG_USER -p $KG_PASSWORD -c "galaxy-zoo-the-galaxy-challenge" -f "training_solutions_rev1.zip"

unzip images_test_rev1.zip
unzip images_training_rev1.zip 
unzip training_solutions_rev1.zip

mv images_test_rev1 test
mv images_training_rev1 train

mkdir valid
cd train
mv `ls -1 | shuf --random-source=../images_training_rev1.zip -n 100` ../valid
