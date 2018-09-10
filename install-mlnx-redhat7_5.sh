#！/bin/bash

for i in `seq 158 158`
    do
	scp /home/clustar/Downloads/MLNX_OFED_LINUX-4.4-2.0.7.0-rhel7.5-x86_64.iso centos@192.168.1.$i:/home/centos/
        ssh centos@192.168.1.$i<<remotessh
	sudo yum install perl pciutils lsof kernel-devel-3.10.0-862.3.2.el7.x86_64 redhat-rpm-config rpm-build gcc gtk2 atk cairo tcl gcc-gfortran tcsh tk -y
	sudo mount -t auto MLNX_OFED_LINUX-4.4-2.0.7.0-rhel7.5-x86_64.iso /media
	cd /media
	sudo ./mlnxofedinstall --skip-distro-check --add-kernel-support --skip-repo
	sudo /etc/init.d/openibd restart
	cd ~
	sudo umount /media
	rm MLNX_OFED_LINUX-4.4-2.0.7.0*.iso
	# sudo reboot
remotessh
    done
