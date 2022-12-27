#!/bin/bash

MAX_SHELL=10
for (( c=1; c<=$MAX_SHELL; c++ )) do gnome-terminal --tab -- ./startProcessTimerHuman.sh; done