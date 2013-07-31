:: create VM
call azure vm create^
  tkntest123.cloudapp.net^
  b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-12_04_2-LTS-amd64-server-20130624-en-us-30GB^
  ubuntu ubuntu#123 -P^
  -e -t W:\home\.ssh\azure-dev-cert.pem^
  -l "East Asia"^
  -z extrasmall

:: open HTTP port
call azure vm endpoint create tkntest123 80 -n "http"

:: link vagrant-managed-servers provider with the azure VM
call vagrant up --provider=managed

:: fix passwordless sudo for azure VMs
call vagrant ssh -c "echo 'ubuntu#123' | sudo -S sed -i 's/(ALL) ALL/(ALL) NOPASSWD: ALL/g' /etc/sudoers.d/waagent"

:: provision!
call vagrant provision