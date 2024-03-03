#!/bin/bash

# List all installed Flatpak applications
applications=$(flatpak list --app --columns=application)

echo "------------------------------------------------------------------------------------"

# Loop through the applications and get their runtimes
for app in $applications; do
  runtime=$(flatpak info $app --show-runtime)
  echo "| App: $app -> Runtime: $runtime"
  echo "|-----------------------------------------------------------------------------------"
done
