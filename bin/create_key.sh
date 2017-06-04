#!/bin/bash
#
# description: Creates a 4096 rsa key with comment
# Options
key_type="rsa"
key_size="4096"
echo "email: "
read user_info
#ask for comment
echo "Comment: "
read key_comment
#append userinfo to comment
key_comment="$key_comment $user_info"

#generate key
ssh-keygen -t "$key_type" -b "$key_size" -C "$key_comment"
