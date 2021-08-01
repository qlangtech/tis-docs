#!/usr/bin/env zsh
# hugo mod clean
ansible-playbook  ./deploy.yml -i ./inventory/hosts
