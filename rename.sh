#!/bin/bash
rm -r Twitter
unzip Twitter-20170226T231129Z-001.zip
cd Twitter
a=1
for i in *.xlsx; do
  new=$(printf "%02d.xlsx" "$a")
  mv -- "$i" "$new"
  let a=a+1
done
