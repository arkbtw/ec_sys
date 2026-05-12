KDIR = /lib/modules/`uname -r`/build
DKMS_KDIR = /lib/modules/$(KERNELRELEASE)/build

kbuild:
	make -C $(DKMS_KDIR) M=`pwd` modules

install:
	wget https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/acpi/ec_sys.c?h=linux-6.19.y -O ec_sys.c
	patch ec_sys.c patch
	dkms install . --force
	bash -c "modprobe ec_sys;echo ec_sys > /etc/modules-load.d/ec_sys.conf"

uninstall:
	bash -c "rmmod ec_sys; rm /etc/modules-load.d/ec_sys.conf" || :
	dkms remove ec_sys/0.1.0 --force --all

clean:
	make -C $(KDIR) M=`pwd` clean
