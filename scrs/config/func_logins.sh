#!/usr/bin/env bash
set -e

# Function logins

enter='U6aMy0wojraho'
homedir='/home/func_logins'
users=( poweroff reboot )

sudo rm -rf "$homedir"
sudo mkdir "$homedir"

sudo touch "$homedir/.hushlogin"

sudo tee "$homedir/.bash_profile" &> /dev/null << EOF
case "\$USER" in
    poweroff    )   systemctl poweroff; exit  ;;
    reboot      )   systemctl reboot; exit    ;;
esac
EOF

for user in "${users[@]}"; do
    if userdbctl user "$user" &> /dev/null; then
        sudo userdel "$user"
    fi
done

sudo useradd -d "$homedir" -s /bin/bash poweroff
printf "poweroff:%s" "$enter" | sudo chpasswd -e

sudo useradd -d "$homedir" -s /bin/bash reboot
printf "reboot:%s" "$enter" | sudo chpasswd -e
