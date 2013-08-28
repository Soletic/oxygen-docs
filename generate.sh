#/bin/bash

git pull
cd ./bundles/framework; git pull
cd ../ui; git pull
cd ../datagrid; git pull

cd ../../
make html
