#!/bin/bash

declare -A user_links=(
    ["world1"]=""
)

for user in "${!user_links[@]}"; do
    user_home="/home/$user"

    readme_path="$user_home/README.md"
    wget -O "$readme_path" "${user_links[$user]}"

    bashrc_path="$user_home/.bashrc"
    echo "cat $readme_path" >> "$bashrc_path"

    chown $user:$user "$readme_path"
    chown $user:$user "$bashrc_path"
done