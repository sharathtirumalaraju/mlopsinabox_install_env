sudo apt-get install python3 ansible
echo "change the host file by deleting the default config and add localhost=127.0.0.1 and save it"
sleep 7s
gedit /etc/ansible/hosts
sleep 30s
ansible-playbook mlopsinabox.yml -e "ansible_python_interpreter=/usr/bin/python3"