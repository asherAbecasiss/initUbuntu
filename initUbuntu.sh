#! /bin/bash





apt-get update -y & wait $!
apt-get upgrade -y & wait $!
apt-get install ffmpeg -y & wait $!
apt install nfs-kernel-server -y & wait $!



apt-get install ca-certificates curl gnupg-y & wait $!
install -m 0755 -d /etc/apt/keyrings  & wait $!
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg & wait $!
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
   tee /etc/apt/sources.list.d/docker.list > /dev/null & wait $!

apt-get update -y & wait $!
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y & wait $!

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip & wait $!

./aws/install & wait $!

curl "https://downloads.mongodb.com/compass/mongodb-compass_1.36.4_amd64.deb" -o "mongodb-compass.deb" & wait $!
apt install ./mongodb-compass.deb & wait $!

curl "https://anydesk.com/en/downloads/linux?dv=deb_64" -o "anydesk.deb" & wait $!
apt install ./anydesk.deb & wait $!


apt install docker-compose -y & wait $!

echo "To Do!"
echo "aws configure"
echo "NFS  ->  https://linuxhint.com/install-and-configure-nfs-server-ubuntu-22-04/"