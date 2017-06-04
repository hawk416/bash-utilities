#!/bin/bash
#
# description: Creates a 4096 key with comment
# Options
echo "email: "
read user_info
key_type="rsa"
key_size="4096"

#ask for comment
echo "Comment: "
read key_comment
#append userinfo to comment
key_comment="$key_comment $user_info"

#generate key
ssh-keygen -t "$key_type" -b "$key_size" -C "$key_comment"
