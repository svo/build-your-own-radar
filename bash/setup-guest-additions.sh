#!/usr/bin/expect -f

set timeout -1

spawn ansible-playbook -i "localhost," --private-key=/home/vagrant/.ssh/private_key -u vagrant -K configuration-management/ansible/playbook-virtualbox.yml -e "ansible_python_interpreter=/usr/bin/python3"

expect "BECOME password:"

send -- "vagrant\r"

expect eof
