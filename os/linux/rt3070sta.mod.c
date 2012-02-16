#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xf61ad07a, "module_layout" },
	{ 0x44443b6c, "register_netdevice" },
	{ 0x9a1dfd65, "strpbrk" },
	{ 0x5a34a45c, "__kmalloc" },
	{ 0xf9a482f9, "msleep" },
	{ 0x5aeb145f, "complete_and_exit" },
	{ 0x4c4fef19, "kernel_stack" },
	{ 0xd6ee688f, "vmalloc" },
	{ 0x349cba85, "strchr" },
	{ 0x3fa913da, "strspn" },
	{ 0x320bbbf9, "dev_set_drvdata" },
	{ 0xc8b57c27, "autoremove_wake_function" },
	{ 0x4d884691, "malloc_sizes" },
	{ 0xb5dcab5b, "remove_wait_queue" },
	{ 0x47939e0d, "__tasklet_hi_schedule" },
	{ 0xbffd9127, "netif_carrier_on" },
	{ 0x1637ff0f, "_raw_spin_lock_bh" },
	{ 0xb3a23075, "skb_clone" },
	{ 0xe08410c5, "dev_get_by_name" },
	{ 0x9f6b4c62, "down_interruptible" },
	{ 0xf83f6d23, "netif_carrier_off" },
	{ 0xc7d5d613, "usb_kill_urb" },
	{ 0xeedfab1f, "filp_close" },
	{ 0xeae3dfd6, "__const_udelay" },
	{ 0xfb0e29f, "init_timer_key" },
	{ 0x85df9b6c, "strsep" },
	{ 0x999e8297, "vfree" },
	{ 0x91715312, "sprintf" },
	{ 0x7d11c268, "jiffies" },
	{ 0xc7340084, "skb_trim" },
	{ 0xe2d5255a, "strcmp" },
	{ 0x2f2a03b4, "netif_rx" },
	{ 0x6395be94, "__init_waitqueue_head" },
	{ 0x71de9b3f, "_copy_to_user" },
	{ 0xffd5a395, "default_wake_function" },
	{ 0x6d0aba34, "wait_for_completion" },
	{ 0x72aa82c6, "param_ops_charp" },
	{ 0xd5f2172f, "del_timer_sync" },
	{ 0x973486c7, "dev_alloc_skb" },
	{ 0x11089ac7, "_ctype" },
	{ 0x8f64aa4, "_raw_spin_unlock_irqrestore" },
	{ 0xe1023091, "current_task" },
	{ 0xf14ab3b, "usb_deregister" },
	{ 0x27e1a049, "printk" },
	{ 0x42224298, "sscanf" },
	{ 0x4141f80, "__tracepoint_module_get" },
	{ 0x2fa5a500, "memcmp" },
	{ 0x86a4e1eb, "free_netdev" },
	{ 0xa1c76e0a, "_cond_resched" },
	{ 0x7ec9bfbc, "strncpy" },
	{ 0x62f6eeb1, "register_netdev" },
	{ 0x9277ad2e, "wireless_send_event" },
	{ 0x1b035a01, "usb_control_msg" },
	{ 0x85abc85f, "strncmp" },
	{ 0x16305289, "warn_slowpath_null" },
	{ 0xbb42f726, "skb_push" },
	{ 0xbb1cf2d4, "dev_close" },
	{ 0x9545af6d, "tasklet_init" },
	{ 0x8834396c, "mod_timer" },
	{ 0xbe2c0274, "add_timer" },
	{ 0x5edc8a6, "kill_pid" },
	{ 0x33ad50e0, "skb_pull" },
	{ 0x34e12df7, "usb_free_coherent" },
	{ 0xf39c2364, "dev_kfree_skb_any" },
	{ 0xd79b5a02, "allow_signal" },
	{ 0x61651be, "strcat" },
	{ 0x82072614, "tasklet_kill" },
	{ 0x32ea85be, "module_put" },
	{ 0xf6ef09d5, "skb_copy_expand" },
	{ 0x5773b5eb, "netif_device_attach" },
	{ 0xba118d52, "usb_submit_urb" },
	{ 0x5742f16f, "netif_device_detach" },
	{ 0xdf00a6f7, "__alloc_skb" },
	{ 0x148747dd, "usb_get_dev" },
	{ 0xba63339c, "_raw_spin_unlock_bh" },
	{ 0xf0fdf6cb, "__stack_chk_fail" },
	{ 0xee06beea, "usb_put_dev" },
	{ 0xd62c833f, "schedule_timeout" },
	{ 0x3aab17c9, "eth_type_trans" },
	{ 0x88492e54, "pskb_expand_head" },
	{ 0x7a172b67, "kmem_cache_alloc_trace" },
	{ 0x9327f5ce, "_raw_spin_lock_irqsave" },
	{ 0x689ba362, "find_get_pid" },
	{ 0x5860aad4, "add_wait_queue" },
	{ 0x37a0cba, "kfree" },
	{ 0x801678, "flush_scheduled_work" },
	{ 0x5c8b5ce8, "prepare_to_wait" },
	{ 0x71e3cecb, "up" },
	{ 0x6a4b5656, "usb_register_driver" },
	{ 0xfa66f77c, "finish_wait" },
	{ 0x7e9ebb05, "kernel_thread" },
	{ 0x91124e53, "unregister_netdev" },
	{ 0xb742fd7, "simple_strtol" },
	{ 0x4b06d2e7, "complete" },
	{ 0x4a5b6bbd, "__netif_schedule" },
	{ 0xa3a5be95, "memmove" },
	{ 0x304a9039, "usb_alloc_coherent" },
	{ 0xdabaf74c, "skb_put" },
	{ 0x77e2f33, "_copy_from_user" },
	{ 0xb43a8878, "dev_get_drvdata" },
	{ 0x736b9fce, "usb_free_urb" },
	{ 0x9e7d6bd0, "__udelay" },
	{ 0xdc43a9c8, "daemonize" },
	{ 0x8d4f2904, "usb_alloc_urb" },
	{ 0xe914e41e, "strcpy" },
	{ 0xdd1fb5e1, "filp_open" },
	{ 0x45db9b38, "alloc_etherdev_mqs" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=usbcore";

MODULE_ALIAS("usb:v148Fp3070d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp3071d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp3072d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p3820d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C15d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C16d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C09d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C11d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C13d*dc*dsc*dp*ic*isc*ip*");

MODULE_INFO(srcversion, "28ED519DF9A3997534B9CF6");
