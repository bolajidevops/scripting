#!/bin/bash

# Prompt the user to enter a number
echo "Enter a number to generate its multiplication table:"
read -r number

# Ask if the user wants a full or partial table
echo "Do you want a full table (1-10) or partial table? Enter 'full' or 'partial':"
read -r choice

# Process the user's choice
if [[ "$choice" == "full" ]]; then
  # Full table from 1 to 10
  echo "Full Multiplication Table for $number:"
  for i in {1..10}; do
    result=$((number * i))
    echo "$number x $i = $result"
  done

elif [[ "$choice" == "partial" ]]; then
  # Partial table: Prompt for start and end range
  echo "Enter the start number of the range:"
  read -r start
  echo "Enter the end number of the range:"
  read -r end

  # Validate the range inputs
  if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ ]]; then
    echo "Error: Start and end values must be valid positive numbers."
    exit 1
  fi

  if ((start > end)); then
    echo "Error: Start number must be less than or equal to the end number."
    exit 1
  fi

  # Generate the partial table
  echo "Partial Multiplication Table for $number (from $start to $end):"
  for ((i = start; i <= end; i++)); do
    result=$((number * i))
    echo "$number x $i = $result"
  done

else
  # Invalid choice
  echo "Error: Please enter 'full' or 'partial'."
  exit 1
fi

