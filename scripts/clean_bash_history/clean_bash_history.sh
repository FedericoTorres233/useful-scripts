#!/bin/bash

# Function to remove words from .bash_history
remove_words_from_bash_history() {
    local word_list_file="$1"
    local home_history_file="$HOME/.bash_history"
    local new_history_file="$(pwd)/new_history_file"
    
    # Check if .bash_history exists
    if [ ! -f "$home_history_file" ]; then
        echo ".bash_history file not found."
        exit 1
    fi

    # Copy .bash_history to working directory if it doesn't exist
    if [ ! -f "$new_history_file" ]; then
    	cp -f $home_history_file $new_history_file
    fi
    
    # Read the list of words to remove
    while IFS= read -r word; do
        # Remove lines containing the word from .bash_history
        sed -i "/^$word\b/d" "$new_history_file"
    done < "$word_list_file"
    
    echo "Filtered words removed from .bash_history successfully."
    echo "File located at $new_history_file."
}

# Check if the word list file is provided as argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <word_list_file>"
    exit 1
fi

# Call the function with provided word list file
remove_words_from_bash_history "$1"
