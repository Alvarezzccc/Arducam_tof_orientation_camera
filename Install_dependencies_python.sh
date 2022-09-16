wget -O install_pivariety_pkgs.sh https://github.com/ArduCAM/Arducam-Pivariety-V4L2-Driver/releases/download/install_script/install_pivariety_pkgs.sh
chmod +x install_pivariety_pkgs.sh
./install_pivariety_pkgs.sh -p kernel_driver

# modfiy config
sudo sed -i "s/\(^camera_auto_detect=*\)/#\1/" /boot/config.txt
sudo bash -c 'echo camera_auto_detect=0 >> /boot/config.txt'
sudo sed -i "s/\(^dtoverlay=*\)/#\1/" /boot/config.txt
sudo bash -c 'echo dtoverlay=vc4-fkms-v3d >> /boot/config.txt'
sudo bash -c 'echo dtoverlay=arducam,media-controller=0 >> /boot/config.txt'

echo "reboot now?(y/n):"
read USER_INPUT
case $USER_INPUT in
'y'|'Y')
    echo "reboot"
    sudo reboot
;;
*)
    echo "cancel"
    echo "The script settings will only take effect after restarting, please restart yourself later."
    exit -1
;;
esac