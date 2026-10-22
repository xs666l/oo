Y700 Gen4 independent mode source prototype

Target values requested:
  Refresh rate label: 170 Hz
  HFP: 40 (per link; confirm driver units)
  VFP: 39
  VBP: 491

This is NOT a functional display-overclock module. It only provides a Kbuild
smoke-test module and records the intended parameters. It does not register a
DRM mode or modify panel timings.

To implement a genuinely independent mode, modify the exact device kernel
source at the panel driver's mode enumeration/timing table. Add a new timing
entry rather than rewriting the existing 165 Hz entry. Ensure the pixel clock,
horizontal/vertical porches, sync widths, DSC parameters, DSI link rates, and
panel command sequence are consistent. Then rebuild the relevant driver/module
against the exact 6.6.89 device kernel build artifacts and verify the generated
mode through DRM/SurfaceFlinger and actual scanout logs.

Build standalone smoke-test:
  export KERNEL_SRC=/path/to/exact/kernel/build/tree
  make -C "$KERNEL_SRC" M="$PWD" ARCH=arm64 LLVM=1 modules

If the kernel tree is not configured and prepared with matching generated
headers and Module.symvers, external-module compilation may fail. Even if this
prototype compiles, it does NOT add a 170 Hz mode.
