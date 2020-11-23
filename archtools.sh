#!/bin/bash

# TODO
# implement:
#   - failed systemd services
#   systemctl --failed
#
#   - errors in /var/log
#   sudo journalctl -p 3 -xb
#
#   - restore from timeshift backup
#   sudo timeshift --restore
#
#   - journalctl logs from boot
#   sudo journalctl -b
#
#   - clean up orphaned packages
#   sudo pacman -Rsn $(pacman -Qdtq)
#
#   sudo journalctl --vacuum-time=2months
#
#   - dump pacman installed packages
#   pacman -Qet | awk '{print $1}' > $HOME/PACMAN-PACKAGES.txt
#
#   - install from a list of packages ($HOME/PACMAN-PACKAGES.txt)
#   pacman -S - < $HOME/PACMAN-PACKAGES.txt

PS3="> "
options=(
    "exit"
    "disk usage"
    "find broken symlinks"
    "pacman update"
    "pacman clean cache"
    "timeshift quick create"
)

select userselection in "${options[@]}"; do
    case $userselection in
        "exit")
            exit;;
        "disk usage")
            echo "df -ih"
            df -ih
            ;;
        "find broken symlinks")
            echo "sudo find / -xtype l -print"
            sudo find / -xtype l -print
            ;;
        "pacman update")
            echo "sudo pacman -Syu"
            sudo pacman -Syu
            ;;
        "pacman clean cache")
            echo "sudo paccache -r"
            sudo paccache -r
            ;;
        "timeshift quick create")
            echo "sudo timeshift --create"
            sudo timeshift --create
            ;;
        *)
            echo "Unknown option." && exit;;
    esac
done

