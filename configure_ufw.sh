# Change iptables to legacy to support ufw
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy

# This is currently leading to problems, postponed
# sudo ufw allow from 192.168.2.0/24 to any port 22

sudo ufw allow 80
sudo ufw allow 443
sudo ufw limit 22
sudo ufw default deny incoming
