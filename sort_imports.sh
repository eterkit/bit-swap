#!/usr/bin/env bash

fvm flutter pub run import_sorter:main
fvm flutter format lib/* -l 80
