#！/bin/bash

for i in `seq 150 158`
    do
	scp /home/clustar/Downloads/MLNX_OFED_LINUX-4.4-2.0.7.0-ubuntu16.04-x86_64.iso ubuntu@192.168.1.$i:/home/ubuntu/
        ssh ubuntu@192.168.1.$i<<remotessh
	sudo mount -t auto MLNX_OFED_LINUX-4.4-2.0.7.0-ubuntu16.04-x86_64.iso /media
	cd /media
	yes|sudo ./mlnxofedinstall
	sudo /etc/init.d/openibd restart
	cd ~
	sudo umount /media
	rm MLNX_OFED_LINUX-4.4-2.0.7.0*.iso
	# sudo reboot
remotessh
    done
