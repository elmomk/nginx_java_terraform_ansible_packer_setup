## Use jenkins to run this


1. change ip in hosts file
2. eval `ssh-agent`
3. ssh-add yourkey.pem

# test if you can actually connect to the servers

4. ansible all -m ping

5. ansible-playbook main.yml --list-hosts
6. ansible-playbook main.yml
