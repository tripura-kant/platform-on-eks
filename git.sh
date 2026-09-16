#!/bin/bash
set -e
git add -A
git commit -m "$(date '+%d-%m-%Y %H:%M:%S')"
git push origin "$(git branch --show-current)"