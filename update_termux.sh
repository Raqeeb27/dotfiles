#!/bin/bash

# File to store the date of the last update
UPDATE_LOG="/data/data/com.termux/files/.last_update"

# Get today's date in DD-MM-YYYY format
TODAY=$(date +%d-%m-%Y)

# Function to update the system using pkg or apt
update_system() {
    local manager=$1
    echo "Updating the system using $manager ..."
    $manager update && $manager upgrade -y
    if [ $? -eq 0 ]; then
        # Update the log with today's date
        echo $TODAY > $UPDATE_LOG
        echo "System updated successfully using $manager."
    else
        echo "System update failed using $manager."
    fi
}

# Default to yes if the user just presses Enter
confirm() {
    read -p "$1 (y/n) [default: y]: " choice
    choice=${choice:-y}
    echo $choice
}

# Function to handle the update process
perform_update() {
    if [ "$1" == "y" ]; then
        faster_choice=$(confirm "Do you want the update to be faster?")
        if [ "$faster_choice" == "y" ]; then
            update_system "apt"
        else
            update_system "pkg"
        fi
    else
        echo "System update skipped."
    fi
}

# Check if the log file exists
if [ -f $UPDATE_LOG ]; then
    LAST_UPDATE=$(cat $UPDATE_LOG)
    if [ "$LAST_UPDATE" == "$TODAY" ]; then
        echo "The system is already up-to-date."
    else
        choice=$(confirm "The system has not been updated today. Do you want to update now?")
        perform_update "$choice"
    fi
else
    choice=$(confirm "No update record found. Do you want to update the system now?")
    perform_update "$choice"
fi
