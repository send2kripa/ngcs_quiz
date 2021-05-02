#!/usr/bin/env bash
# Please provide worker node username and hostname to copy source files to worker node; This setup is required to run the playbook successfully.
username=$1
hostname=$2
echo 'Copy and extract source files to remote host'
scp files_dir.zip $username@$hostname:/tmp/
ssh $username@$hostname "cd /tmp; unzip files_dir.zip"

echo 'Copy and extract source files to local host'
cp test_user_files.zip /tmp/
cd /tmp/; unzip test_user_files.zip

# user 'test' must exist on the ansible master host.
sudo useradd test
