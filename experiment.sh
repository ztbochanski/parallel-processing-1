#!/bin/bash

CXX=clang++

SRC_FILE=main.cpp
OUT_FILE=main

for t in 1 2 4 8 12 16 20 24 32
do
  for n in 1 10 100 1000 10000 100000 500000 1000000
  do
    $CXX -Xpreprocessor -fopenmp -I/usr/local/opt/libomp/include -L/usr/local/opt/libomp/lib -lomp -DNUMT=$t -DNUMTRIALS=$n $SRC_FILE -o $OUT_FILE
    ./$OUT_FILE
  done
done
