obj-m += y700_independent_mode.o

# Build using the exact target kernel build tree:
# make -C "$KERNEL_SRC" M="$PWD" ARCH=arm64 LLVM=1 modules
