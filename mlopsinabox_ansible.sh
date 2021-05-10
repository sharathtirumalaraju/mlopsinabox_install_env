#if already using python3, please use the command below
#sudo apt-get install python3 ansible
sudo apt-get install python ansible
echo "change the host file by deleting the default config and add localhost=127.0.0.1 and save it"
sleep 10s
gedit /etc/ansible/hosts
sleep 30s
ansible-playbook mlopsinabox.yml