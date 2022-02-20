#!/bin/sh
expr $(dnf list updates | wc -l) - 1
