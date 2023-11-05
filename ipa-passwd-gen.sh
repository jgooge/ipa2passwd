#!/bin/bash

# The output file
output_file="./passwd_from_idm"

# Get user list from IDM
user_list=$(ipa user-find --all --raw | grep ' uid: ' | awk '{print $2}')

# Empty the output file
> "$output_file"

# Loop over users and format the output
for user in $user_list; do
    # Obtain user information from IDM
    user_info=$(ipa user-show $user --all --raw)

    # Extract necessary attributes
    uid=$(echo "$user_info" | grep -i ' uid: ' | awk '{print $2}')
    uuid=$(echo "$user_info" | grep -i ' uidnumber: ' | awk '{print $2}')
    gid=$(echo "$user_info" | grep -i ' gidnumber: ' | awk '{print $2}')
    gecos=$(echo "$user_info" | grep -i ' displayname: ' | cut -d: -f2- | sed 's/^ //' )
    home_dir=$(echo "$user_info" | grep -i ' homedirectory: ' | awk '{print $2}')
    login_shell=$(echo "$user_info" | grep -i ' loginshell: ' | awk '{print $2}')

    # Write to output file in passwd format
    echo "$uid:x:$uuid:$gid:$gecos:$home_dir:$login_shell" >> "$output_file"
done

# Display the generated file
cat "$output_file"
