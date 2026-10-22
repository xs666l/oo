# Y700 Gen4 170Hz GitHub Actions build kit

## How to build
1. Create a GitHub repository and upload the contents of this directory to its root (including `.github/workflows/build.yml`).
2. Open **Actions** and enable workflows if prompted.
3. Run **Build Y700 Gen4 170Hz experimental module** with **Run workflow**.
4. Keep `enable_patch` unchecked for the first build. Download `Y700-170Hz-KernelSU-build` from the run's Artifacts.

## Important technical limitation
This source only attempts to rewrite the existing 165Hz mode-list entry. It does **not** create a new independent DRM/Android refresh-rate mode. The workflow compiles against an Android common 6.6 baseline, which may not match the device's vendor kernel ABI. A successful CI build is not proof that the module can load or that the display can run at 170Hz. For a real independent mode, the Qualcomm DSI panel driver's mode table and mode enumeration must be changed in the exact vendor kernel source and rebuilt as part of a compatible kernel/vendor image.
