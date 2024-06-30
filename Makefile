
MY_MODULE=ch341
MY_VERSION=6.5.0

obj-m = $(MY_MODULE).o

#
# Point --sourcetree at the directory above this file.
# Add --dkmstree /where if you don't want to use /var/lib/dkms/
# Add --installtree if you don't want to use /lib/modules/
#
DKMS_FLAGS= -m $(MY_MODULE) -v $(MY_VERSION) --sourcetree "`pwd`/.." $(USER_DKMS_FLAGS)

# Because I don't want to name my git-repo like ch341-6.5.0
make_link:
	ln -sf `pwd` `pwd`/../$(MY_MODULE)-$(MY_VERSION)

my_dkms_add: make_link
	sudo dkms add $(DKMS_FLAGS)

my_dkms_remove:
	sudo dkms remove $(DKMS_FLAGS) -k `uname -r`

my_dkms_build:
	sudo dkms build $(DKMS_FLAGS)

my_dkms_install:
	sudo dkms install $(DKMS_FLAGS)

