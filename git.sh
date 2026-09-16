#!/bin/bash
set -e
git add -A
git commit -m "$(date '+%d-%m-%Y %H:%M:%S')"
git pull --rebase origin "$(git branch --show-current)"
git push origin "$(git branch --show-current)"