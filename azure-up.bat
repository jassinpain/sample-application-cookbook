:: create VM
azure vm create^
  trs-test-for-hcn.cloudapp.net^
  b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-12_04_2-LTS-amd64-server-20130624-en-us-30GB^
  ubuntu ubuntu#123 -P^
  -e -t W:\home\.ssh\azure-dev-cert.pem^
  -l "East Asia"^
  -z extrasmall
