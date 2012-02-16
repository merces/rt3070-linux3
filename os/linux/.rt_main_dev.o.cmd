cmd_/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/rt_main_dev.o := gcc -Wp,-MD,/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/.rt_main_dev.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.6/include -I/usr/src/linux-headers-3.2.0-1-common/arch/x86/include -Iarch/x86/include/generated -Iinclude  -I/usr/src/linux-headers-3.2.0-1-common/include -include /usr/src/linux-headers-3.2.0-1-common/include/linux/kconfig.h   -I/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -m64 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -fstack-protector -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -Wframe-larger-than=2048 -Wno-unused-but-set-variable -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -DAGGREGATION_SUPPORT -DPIGGYBACK_SUPPORT -DWMM_SUPPORT -DLINUX -Wall -Wstrict-prototypes -Wno-trigraphs -Wpointer-sign -D_GCC_WRAP_STDINT_H -DCONFIG_STA_SUPPORT -DDBG -DWPA_SUPPLICANT_SUPPORT -DNATIVE_WPA_SUPPLICANT_SUPPORT -DDOT11_N_SUPPORT -DRTMP_MAC_USB -DRT30xx -DRT3070 -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT   -I/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(rt_main_dev)"  -D"KBUILD_MODNAME=KBUILD_STR(rt3070sta)" -c -o /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/.tmp_rt_main_dev.o /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/rt_main_dev.c

source_/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/rt_main_dev.o := /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/rt_main_dev.c

deps_/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/rt_main_dev.o := \
    $(wildcard include/config/apsta/mixed/support.h) \
    $(wildcard include/config/sta/support.h) \
    $(wildcard include/config/opmode/on/sta.h) \
    $(wildcard include/config/5vt/enhance.h) \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rt_config.h \
    $(wildcard include/config/h//.h) \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_type.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_os.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/os/rt_linux.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/module.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/debug/set/module/ronx.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/types.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/types.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/int-ll64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/bitsperlong.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/bitsperlong.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/posix_types.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/stddef.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/compiler-gcc4.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/x86/32.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/posix_types_64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/const.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/stat.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/stat.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/compaction.h) \
  /usr/lib/gcc/x86_64-linux-gnu/4.6/include/stdarg.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/linkage.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/stringify.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/bitops.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/x86/cmov.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/paravirt.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/asm.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/cpufeature.h \
    $(wildcard include/config/x86/invlpg.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/required-features.h \
    $(wildcard include/config/x86/minimum/cpu/family.h) \
    $(wildcard include/config/math/emulation.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/x86/cmpxchg64.h) \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/p6/nop.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/bitops/sched.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/arch_hweight.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/bitops/const_hweight.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/bitops/fls64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/bitops/le.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/byteorder.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/byteorder/little_endian.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/swab.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/swab.h \
    $(wildcard include/config/x86/bswap.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/byteorder/generic.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/typecheck.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/printk.h \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/init.h \
    $(wildcard include/config/hotplug.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dynamic_debug.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
    $(wildcard include/config/x86/internode/cache/shift.h) \
    $(wildcard include/config/x86/vsmp.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/seqlock.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/debug/stack/usage.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/page.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/page_types.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/physical/start.h) \
    $(wildcard include/config/physical/align.h) \
    $(wildcard include/config/flatmem.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/page_64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/memory_model.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/getorder.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/processor.h \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/m386.h) \
    $(wildcard include/config/m486.h) \
    $(wildcard include/config/x86/debugctlmsr.h) \
    $(wildcard include/config/cpu/sup/amd.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/vm86.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/vm86.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/ptrace.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/ptrace-abi.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/segment.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/paravirt_types.h \
    $(wildcard include/config/x86/local/apic.h) \
    $(wildcard include/config/paravirt/debug.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/desc_defs.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/kmap_types.h \
    $(wildcard include/config/debug/highmem.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/kmap_types.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/compat/vdso.h) \
    $(wildcard include/config/proc/fs.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/pgtable_64_types.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/ptrace.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/math_emu.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/sigcontext.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/current.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/x86/64/smp.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/system.h \
    $(wildcard include/config/ia32/emulation.h) \
    $(wildcard include/config/x86/32/lazy/gs.h) \
    $(wildcard include/config/x86/ppro/fence.h) \
    $(wildcard include/config/x86/oostore.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/cmpxchg.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/cmpxchg_64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/nops.h \
    $(wildcard include/config/mk7.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/irqflags.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/paravirt.h \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/paravirt/spinlocks.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/bitmap.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/string.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/string_64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/msr.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/msr-index.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/ioctl.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/ioctl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/ioctl.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/errno.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/errno.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/errno-base.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/cpumask.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/personality.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/math64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/div64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/div64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/err.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/ftrace.h \
    $(wildcard include/config/function/tracer.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/atomic.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/atomic64_64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/atomic-long.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/bottom_half.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/spinlock_types.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/spinlock_types.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/rwlock.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/rcu.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rwlock_types.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/spinlock.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rwlock.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/inline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/kmod.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/gfp.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/arch/populates/node/map.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/cgroup/mem/res/ctlr.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/wait.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/nodemask.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  include/generated/bounds.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/notifier.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/errno.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/have/arch/mutex/cpu/relax.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/rwsem.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/srcu.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/mmzone.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/mmzone_64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/smp.h \
    $(wildcard include/config/x86/io/apic.h) \
    $(wildcard include/config/x86/32/smp.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/mpspec.h \
    $(wildcard include/config/x86/numaq.h) \
    $(wildcard include/config/mca.h) \
    $(wildcard include/config/eisa.h) \
    $(wildcard include/config/x86/mpparse.h) \
    $(wildcard include/config/acpi.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/mpspec_def.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/x86_init.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/bootparam.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/screen_info.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/apm_bios.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/edd.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/e820.h \
    $(wildcard include/config/efi.h) \
    $(wildcard include/config/intel/txt.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/memtest.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/ioport.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/ist.h \
  /usr/src/linux-headers-3.2.0-1-common/include/video/edid.h \
    $(wildcard include/config/x86.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/apicdef.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/apic.h \
    $(wildcard include/config/x86/x2apic.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pm.h \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/pm/runtime.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/jiffies.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/timex.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/param.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/param.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/timex.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/tsc.h \
    $(wildcard include/config/x86/tsc.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/completion.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/provide/ohci1394/dma/init.h) \
    $(wildcard include/config/x86/visws/apic.h) \
    $(wildcard include/config/x86/f00f/bug.h) \
    $(wildcard include/config/x86/cyclone/timer.h) \
    $(wildcard include/config/pci/mmconfig.h) \
    $(wildcard include/config/x86/mrst.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/acpi.h \
    $(wildcard include/config/acpi/numa.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/acpi/pdc_intel.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/numa.h \
    $(wildcard include/config/numa/emu.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/topology.h \
    $(wildcard include/config/x86/ht.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/topology.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/numa_64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/mmu.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/trampoline.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/io.h \
    $(wildcard include/config/xen.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/iomap.h \
    $(wildcard include/config/has/ioport.h) \
    $(wildcard include/config/pci.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/vmalloc.h \
    $(wildcard include/config/mmu.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/xen/xen.h \
    $(wildcard include/config/xen/dom0.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/xen/interface/xen.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/xen/interface.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/xen/interface_64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/pvclock-abi.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/xen/hypervisor.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/vsyscall.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/vvar.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/io_apic.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/irq_vectors.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/sparsemem.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/sched/book.h) \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pfn.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/sysctl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/torture/test.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/no/hz.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tiny/preempt/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/preempt/rt.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rcutree.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/elf.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/elf-em.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/elf.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/user.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/user_64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/auxvec.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/vdso.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/kobject.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/sysfs.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/kobject_ns.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/kref.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/tracepoint.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/export.h \
    $(wildcard include/config/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/module.h \
    $(wildcard include/config/m586.h) \
    $(wildcard include/config/m586tsc.h) \
    $(wildcard include/config/m586mmx.h) \
    $(wildcard include/config/mcore2.h) \
    $(wildcard include/config/matom.h) \
    $(wildcard include/config/m686.h) \
    $(wildcard include/config/mpentiumii.h) \
    $(wildcard include/config/mpentiumiii.h) \
    $(wildcard include/config/mpentiumm.h) \
    $(wildcard include/config/mpentium4.h) \
    $(wildcard include/config/mk6.h) \
    $(wildcard include/config/mk8.h) \
    $(wildcard include/config/melan.h) \
    $(wildcard include/config/mcrusoe.h) \
    $(wildcard include/config/mefficeon.h) \
    $(wildcard include/config/mwinchipc6.h) \
    $(wildcard include/config/mwinchip3d.h) \
    $(wildcard include/config/mcyrixiii.h) \
    $(wildcard include/config/mviac3/2.h) \
    $(wildcard include/config/mviac7.h) \
    $(wildcard include/config/mgeodegx1.h) \
    $(wildcard include/config/mgeode/lx.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/module.h \
  /usr/src/linux-headers-3.2.0-1-common/include/trace/events/module.h \
  /usr/src/linux-headers-3.2.0-1-common/include/trace/define_trace.h \
  include/linux/version.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/slab.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/slab_def.h \
  /usr/src/linux-headers-3.2.0-1-common/include/trace/events/kmem.h \
  /usr/src/linux-headers-3.2.0-1-common/include/trace/events/gfpflags.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/kmalloc_sizes.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/interrupt.h \
    $(wildcard include/config/generic/hardirqs.h) \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/irqreturn.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/irqnr.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/hardirq.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/hardirq.h \
    $(wildcard include/config/x86/thermal/vector.h) \
    $(wildcard include/config/x86/mce/threshold.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/irq.h \
    $(wildcard include/config/s390.h) \
    $(wildcard include/config/irq/release/method.h) \
    $(wildcard include/config/generic/pending/irq.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/irq.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/irq_regs.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/irqdesc.h \
    $(wildcard include/config/irq/preflow/fasteoi.h) \
    $(wildcard include/config/sparse/irq.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/hw_irq.h \
    $(wildcard include/config/irq/remap.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/profile.h \
    $(wildcard include/config/profiling.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/sections.h \
    $(wildcard include/config/debug/rodata.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/sections.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/uaccess.h \
    $(wildcard include/config/x86/wp/works/ok.h) \
    $(wildcard include/config/x86/intel/usercopy.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/uaccess_64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/timerfd.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rbtree.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/timerqueue.h \
  /usr/src/linux-headers-3.2.0-1-common/include/trace/events/irq.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pci.h \
    $(wildcard include/config/pci/iov.h) \
    $(wildcard include/config/pcieaspm.h) \
    $(wildcard include/config/pci/msi.h) \
    $(wildcard include/config/pci/ats.h) \
    $(wildcard include/config/pcieportbus.h) \
    $(wildcard include/config/pcieaer.h) \
    $(wildcard include/config/pcie/ecrc.h) \
    $(wildcard include/config/ht/irq.h) \
    $(wildcard include/config/pci/domains.h) \
    $(wildcard include/config/pci/quirks.h) \
    $(wildcard include/config/hotplug/pci.h) \
    $(wildcard include/config/of.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pci_regs.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/mod_devicetable.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/klist.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/device.h \
    $(wildcard include/config/intel/iommu.h) \
    $(wildcard include/config/amd/iommu.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pm_wakeup.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/io.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pci_ids.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pci-dma.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dmapool.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/scatterlist.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/need/sg/dma/length.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/pci.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/mm.h \
    $(wildcard include/config/sysctl.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/ksm.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/prio_tree.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/want/page/debug/flags.h) \
    $(wildcard include/config/cmpxchg/local.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mm/owner.h) \
    $(wildcard include/config/mmu/notifier.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/auxvec.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/page-debug-flags.h \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/page/debug/something/else.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/range.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/bit_spinlock.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/shrinker.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/pgtable.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/pgtable_64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/pgtable_64_types.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/pgtable.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/page-flags.h \
    $(wildcard include/config/pageflags/extended.h) \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/huge_mm.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/vm_event_item.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/pci_64.h \
    $(wildcard include/config/calgary/iommu.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/pci-dma-compat.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dma-mapping.h \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/have/dma/attrs.h) \
    $(wildcard include/config/need/dma/map/state.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dma-attrs.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/bug.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dma-direction.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/scatterlist.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/dma-mapping.h \
    $(wildcard include/config/isa.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/kmemcheck.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dma-debug.h \
    $(wildcard include/config/dma/api/debug.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/swiotlb.h \
    $(wildcard include/config/swiotlb.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/swiotlb.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/dma-coherent.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/dma-mapping-common.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/pci.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/netdevice.h \
    $(wildcard include/config/dcb.h) \
    $(wildcard include/config/wlan.h) \
    $(wildcard include/config/ax25.h) \
    $(wildcard include/config/mac80211/mesh.h) \
    $(wildcard include/config/tr.h) \
    $(wildcard include/config/net/ipip.h) \
    $(wildcard include/config/net/ipgre.h) \
    $(wildcard include/config/ipv6/sit.h) \
    $(wildcard include/config/ipv6/tunnel.h) \
    $(wildcard include/config/netpoll.h) \
    $(wildcard include/config/rps.h) \
    $(wildcard include/config/xps.h) \
    $(wildcard include/config/rfs/accel.h) \
    $(wildcard include/config/net/poll/controller.h) \
    $(wildcard include/config/fcoe.h) \
    $(wildcard include/config/libfcoe.h) \
    $(wildcard include/config/wireless/ext.h) \
    $(wildcard include/config/vlan/8021q.h) \
    $(wildcard include/config/net/dsa.h) \
    $(wildcard include/config/net/ns.h) \
    $(wildcard include/config/net/dsa/tag/dsa.h) \
    $(wildcard include/config/net/dsa/tag/trailer.h) \
    $(wildcard include/config/netpoll/trap.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/if.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/socket.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/socket.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/socket.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/sockios.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/sockios.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/sockios.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/uio.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/hdlc/ioctl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/if_ether.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/skbuff.h \
    $(wildcard include/config/nf/conntrack.h) \
    $(wildcard include/config/bridge/netfilter.h) \
    $(wildcard include/config/nf/defrag/ipv4.h) \
    $(wildcard include/config/nf/defrag/ipv6.h) \
    $(wildcard include/config/xfrm.h) \
    $(wildcard include/config/net/sched.h) \
    $(wildcard include/config/net/cls/act.h) \
    $(wildcard include/config/ipv6/ndisc/nodetype.h) \
    $(wildcard include/config/net/dma.h) \
    $(wildcard include/config/network/secmark.h) \
    $(wildcard include/config/network/phy/timestamping.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/net.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/random.h \
    $(wildcard include/config/arch/random.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/archrandom.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/fcntl.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/fcntl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/fcntl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/textsearch.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/checksum.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/checksum.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/checksum_64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dmaengine.h \
    $(wildcard include/config/async/tx/enable/channel/switch.h) \
    $(wildcard include/config/dma/engine.h) \
    $(wildcard include/config/async/tx/dma.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/if_packet.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/if_link.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/netlink.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/capability.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pm_qos.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/miscdevice.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/major.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/delay.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/delay.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/delay.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rculist.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/ethtool.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/compat.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/sem.h \
    $(wildcard include/config/sysvipc.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/ipc.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/ipcbuf.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/ipcbuf.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/sembuf.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/fs.h \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/debug/writecount.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/limits.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/blk_types.h \
    $(wildcard include/config/blk/dev/integrity.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/kdev_t.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dcache.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rculist_bl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/list_bl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/path.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/radix-tree.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pid.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/semaphore.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/fiemap.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/percpu_counter.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dqblk_xfs.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dqblk_v1.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dqblk_v2.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dqblk_qtree.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/nfs_fs_i.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/nfs.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/sunrpc/msg_prot.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/inet.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/aio_abi.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/compat.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/lockup/detector.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/cfs/bandwidth.h) \
    $(wildcard include/config/cgroup/sched.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/cputime.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/cputime.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/signal.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/signal.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/signal-defs.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/siginfo.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/siginfo.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/proportions.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/seccomp.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/seccomp_64.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/unistd.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/unistd.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/unistd_64.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/ia32_unistd.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/resource.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/resource.h \
  /usr/src/linux-headers-3.2.0-1-common/include/asm-generic/resource.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/latencytop.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/user/ns.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/key.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/aio.h \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/user32.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/net_namespace.h \
    $(wildcard include/config/ipv6.h) \
    $(wildcard include/config/ip/dccp.h) \
    $(wildcard include/config/netfilter.h) \
    $(wildcard include/config/wext/core.h) \
    $(wildcard include/config/net.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/core.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/mib.h \
    $(wildcard include/config/xfrm/statistics.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/net/snmp.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/snmp.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/u64_stats_sync.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/unix.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/packet.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/ipv4.h \
    $(wildcard include/config/ip/multiple/tables.h) \
    $(wildcard include/config/ip/mroute.h) \
    $(wildcard include/config/ip/mroute/multiple/tables.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/net/inet_frag.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/ipv6.h \
    $(wildcard include/config/ipv6/multiple/tables.h) \
    $(wildcard include/config/ipv6/mroute.h) \
    $(wildcard include/config/ipv6/mroute/multiple/tables.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/net/dst_ops.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/dccp.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/x_tables.h \
    $(wildcard include/config/bridge/nf/ebtables.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/netfilter.h \
    $(wildcard include/config/netfilter/debug.h) \
    $(wildcard include/config/nf/nat/needed.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/in.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/in6.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/flow.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/proc_fs.h \
    $(wildcard include/config/proc/devicetree.h) \
    $(wildcard include/config/proc/kcore.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/magic.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/conntrack.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/list_nulls.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/netns/xfrm.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/xfrm.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/seq_file_net.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/seq_file.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/dsa.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/dcbnl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/dcbnl.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/etherdevice.h \
    $(wildcard include/config/have/efficient/unaligned/access.h) \
  /usr/src/linux-headers-3.2.0-1-common/arch/x86/include/asm/unaligned.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/unaligned/access_ok.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/unaligned/generic.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/wireless.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/if_arp.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/ctype.h \
  /usr/src/linux-headers-3.2.0-1-common/include/net/iw_handler.h \
    $(wildcard include/config/wext/priv.h) \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_def.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/oid.h \
    $(wildcard include/config/status.h) \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_chip.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/chip/rt3070.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/chip/mac_usb.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_type.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/chip/rtmp_mac.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/chip/rtmp_phy.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_iface.h \
    $(wildcard include/config/.h) \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/iface/rtmp_usb.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtusb_io.h \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/usb.h \
    $(wildcard include/config/usb/devicefs.h) \
    $(wildcard include/config/usb/mon.h) \
    $(wildcard include/config/usb/device/class.h) \
    $(wildcard include/config/usb/suspend.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/usb/ch9.h \
    $(wildcard include/config/size.h) \
    $(wildcard include/config/att/one.h) \
    $(wildcard include/config/att/selfpower.h) \
    $(wildcard include/config/att/wakeup.h) \
    $(wildcard include/config/att/battery.h) \
  /usr/src/linux-headers-3.2.0-1-common/include/linux/pm_runtime.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_dot11.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/chip/rt30xx.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_timer.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/mlme.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_dot11.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/wpa.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/crypt_md5.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rt_config.h \
  /usr/lib/gcc/x86_64-linux-gnu/4.6/include/stdint.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/crypt_sha2.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/crypt_hmac.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_cmd.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp.h \
    $(wildcard include/config/ap/support.h) \
    $(wildcard include/config/opmode/on/ap.h) \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/link_list.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/spectrum_def.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/ap.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/dfs.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/chlist.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/spectrum.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/eeprom.h \
  /home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/include/rtmp_mcu.h \

/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/rt_main_dev.o: $(deps_/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/rt_main_dev.o)

$(deps_/home/fernando/drivers/dwa-125/2009_1204_RT3070_Linux_STA_v2.1.2.0/os/linux/../../os/linux/rt_main_dev.o):
