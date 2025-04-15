#!/bin/bash

# Function to print text in red
print_red() {
    local text="$1"
    echo -e "\033[0;31m$text\033[0m"
}

# Function to print text in green
print_green() {
    local text="$1"
    echo -e "\033[0;32m$text\033[0m"
}

# Function to print text in yellow
print_yellow() {
    local text="$1"
    echo -e "\033[0;33m$text\033[0m"
}

# Function to print text in blue
print_blue() {
    local text="$1"
    echo -e "\033[0;34m$text\033[0m"
}

# Function to print text in grey
print_grey() {
    local text="$1"
    echo -e "\090[0;34m$text\090[0m"
}
