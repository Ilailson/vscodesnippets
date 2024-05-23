#!/bin/bash

# Evandro Chagas Institute
# Team: SOTIC
# Created: May 22, 2024
# Description:
#
# This script is useful for developers who manage multiple sets of VS Code snippets
# and want a streamlined way to deploy them across different environments or profiles.

# Usage:
#  ./install.sh
#  ./install.sh 1  => Enable debug mode.

# Dependencies: VS Code

# Credits: MARCOS NAZARIO

# License: copyright

# ====================================================================
# VARIABLES
# ====================================================================

DIR_USER="$HOME/.config/Code/User"
DIR_SNIPPET="$DIR_USER/snippets"
DIR_PROFILE="$DIR_USER/profiles"
DEBUG_MODE="${1:-0}"

# ====================================================================
# METHODS
# ====================================================================

function uninstall() {

    echo ''
    echo '# ===================================================================='
    echo '# UNINSTALL SNIPPETS FOR VSCODE'
    echo '# ===================================================================='
    echo ''

    # Find all our snippets.
    while read -r line_snippet; do

        # Variable
        snippet_name=$(echo "$line_snippet"  | awk -F '/' '{print $NF}')
        echo "=> $snippet_name"

        # Find all our links inside of vscode user directory.
        while read -r line_link; do

            if [[ $DEBUG_MODE -eq 1 ]]; then
                echo "Removed link: $line_link"
            fi

            # Remove our link.
            unlink $line_link

        done < <(find $DIR_USER -type l -name "$snippet_name")

        if [[ $DEBUG_MODE -eq 1 ]]; then
            echo ''
        fi
    done < <(find . -type f -name '*.code-snippets')
}

function install() {

    echo ''
    echo '# ===================================================================='
    echo '# INSTALL SNIPPETS FOR VSCODE'
    echo '# ===================================================================='
    echo ''

    # Find all our snippets.
    while read -r line_snippet; do

        # Variables
        snippet_path=$PWD
        snippet_path+=$(echo "$line_snippet" | sed 's|\.||')
        snippet_name=$(echo "$line_snippet"  | awk -F '/' '{print $NF}')

        echo "=> $snippet_name"

        if [[ $DEBUG_MODE -eq 1 ]]; then
            echo "Link $DIR_SNIPPET"
        fi

        # Create link to default profile.
        ln -s $snippet_path $DIR_SNIPPET/$snippet_name

        # Directory exists
        if [ -d $DIR_PROFILE ]; then

            # Find all created profiles inside vscode user directory.
            while read -r line_profile; do

                if [[ $DEBUG_MODE -eq 1 ]]; then
                    echo "Link $line_profile"
                fi

                # Create link to found profile.
                ln -s $snippet_path $line_profile/$snippet_name

            done < <(find $DIR_PROFILE -type d -name 'snippets')
        fi

        if [[ $DEBUG_MODE -eq 1 ]]; then
            echo ''
        fi
    done < <(find . -type f -name '*.code-snippets')
}

# ====================================================================
# MAIN
# ====================================================================

clear
uninstall
install

echo 'End.'
