
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>

MODULE_LICENSE("GPL");

static int mymodule_init(void) {
	printk("<1> %s:%s()\n", __FILE__, __FUNCTION__);
	return 0;
}
module_init(mymodule_init);

static void mymodule_exit(void) {
	printk("<1> %s:%s()\n", __FILE__, __FUNCTION__);
}
module_exit(mymodule_exit);
