#!/bin/bash

cd ./csharp/
docker build -t csharp-env .
cd ..

cd ./node/
docker build -t ts-env .
cd ..

cd ./python/
docker build -t py-env .
cd ..

cd ./golang/
docker build -t go-env .
cd ..

cd ./rust/
docker build -t rust-env .
