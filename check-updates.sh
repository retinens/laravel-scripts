#!/bin/bash
git update-index -q --refresh
if ! git diff-index --quiet HEAD --; then
  echo "Updating the script"
  git pull
fi
