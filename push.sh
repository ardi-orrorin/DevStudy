#!/bin/sh

echo "Git Push Script"

git add .
git commit -m "${1:-update}"
git push