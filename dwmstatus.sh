#!/bin/bash

while (true); do
  date=$(date +"%A, %B %d, %H:%M")
  xsetroot -name "$date"

  sleep 1m
done
