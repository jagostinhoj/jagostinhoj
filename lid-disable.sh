sudo mkdir -p /etc/systemd/logind.conf.d

sudo tee /etc/systemd/logind.conf.d/10-laptop-server.conf > /dev/null <<'EOF'
[Login]
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
IdleAction=ignore
EOF

sudo systemctl restart systemd-logind
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target
sudo systemctl daemon-reload