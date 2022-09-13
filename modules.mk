WLAN_DRIVER_PATH := device/samung/j1pop3g/wcn/wifi/sc2331/5.1

ifeq ($(TARGET_BUILD_VARIANT),eng)
MBUILD_VAR := debug
else
MBUILD_VAR := release
endif

SPRD_MODULES:
	mkdir -p $(PRODUCT_OUT)/system/lib/modules
	$(hide) if grep -q '^CONFIG_MODULES=y' $(KERNEL_CONFIG); then \
			echo "Installing Kernel Modules"; \
			$(MAKE) $(MAKE_FLAGS) -C $(KERNEL_SRC) O=$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) $(KERNEL_CROSS_COMPILE) INSTALL_MOD_PATH=../../$(KERNEL_MODULES_INSTALL) modules_install && \
			mofile=$$(find $(KERNEL_MODULES_OUT) -type f -name modules.order) && \
			mpath=$$(dirname $$mofile) && \
			for f in $$(find $$mpath/kernel -type f -name '*.ko'); do \
				$(KERNEL_TOOLCHAIN_PATH)strip --strip-unneeded $$f; \
				mv $$f $(KERNEL_MODULES_OUT); \
				mfile=$$(basename $$f); \
				ln -sf /lib/modules/$$mfile $(PRODUCT_OUT)/system/lib/modules/$$mfile; \
			done && \
			rm -rf $$mpath; \
		fi
	make $(MAKE_FLAGS) -C $(WLAN_DRIVER_PATH) SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=$(MBUILD_VAR) KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(KERNEL_CROSS_COMPILE) clean
	make $(MAKE_FLAGS) -C $(WLAN_DRIVER_PATH) SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=$(MBUILD_VAR) KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(KERNEL_CROSS_COMPILE)
	mv $(WLAN_DRIVER_PATH)/sprdwl.ko $(KERNEL_MODULES_OUT)
	ln -sf /lib/modules/mali.ko $(PRODUCT_OUT)/system/lib/modules/mali.ko
	ln -sf /lib/modules/sprdwl.ko $(PRODUCT_OUT)/system/lib/modules/sprdwl.ko
