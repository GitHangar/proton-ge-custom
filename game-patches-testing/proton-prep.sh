#!/bin/bash

    # Valve DXVK patches
    cd dxvk
    git reset --hard HEAD
    git clean -xdf
    patch -Np1 < ../game-patches-testing/dxvk-patches/valve-dxvk-avoid-spamming-log-with-requests-for-IWineD3D11Texture2D.patch
    cd ..

    #WINE
    cd wine
    git reset --hard HEAD
    git clean -xdf

    #HOT FIXES

    # https://bugs.winehq.org/show_bug.cgi?id=45774
    git revert --no-commit 6ccb94392a8ef4bca701ae2a560f4ea1da677edd

    # https://bugs.winehq.org/show_bug.cgi?id=47633
    patch -Np1 < ../game-patches-testing/wine-patches/4.14-hotfix-kernel-SetThreadStackGuarantee.patch

    # https://bugs.winehq.org/show_bug.cgi?id=47636
    patch -Np1 < ../game-patches-testing/wine-patches/4.14-hotfix-upside-down-text-wined3d.patch



    #WINE STAGING
    echo "applying staging patches"
    ../wine-staging/patches/patchinstall.sh DESTDIR="." --all -W winex11.drv-mouse-coorrds -W server-Desktop_Refcount -W ws2_32-TransmitFile

    #WINE VULKAN
    echo "applying winevulkan patches"
    patch -Np1 < ../game-patches-testing/wine-patches/winevulkan-childwindow.patch

    #WINE FAUDIO
    echo "applying faudio patches"
    patch -Np1 < ../game-patches-testing/faudio-patches/faudio-ffmpeg.patch

    #WINE GAME PATCHES

    echo "mech warrior online"
    patch -Np1 < ../game-patches-testing/game-patches/mwo.patch

    echo "warframe"
    patch -Np1 < ../game-patches-testing/game-patches/warframe-f6-screenshot-fix.patch

    echo "final fantasy XIV"
    patch -Np1 < ../game-patches-testing/game-patches/ffxiv-launcher.patch

    echo "assetto corsa"
    patch -Np1 < ../game-patches-testing/game-patches/assettocorsa-hud.patch

    echo "sword art online"
    patch -Np1 < ../game-patches-testing/game-patches/sword-art-online-gnutls.patch

    echo "steam crossover patch"
    patch -Np1 < ../game-patches-testing/game-patches/steam-crossover.patch

    #WINE FSYNC
    echo "applying fsync patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-fsync_staging.patch

    #PROTON
    echo "applying proton patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-protonify_staging.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-LAA_staging.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-use_clock_monotonic.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-amd_ags.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-hide_prefix_update_window.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-FS_bypass_compositor.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-fullscreen_hack_staging.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-fullscreen_hack_realmodes.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-vk_bits_4.5+.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-sdl_joy.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-sdl_joy_2.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-gamepad_additions.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-apply_LargeAddressAware_fix_for_Bayonetta.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-Set_amd_ags_x64_to_built_in_for_Wolfenstein_2.patch

    #need for VR to compile
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-wined3d_staging.patch

    #WINE CUSTOM PATCHES
    #add your own custom patch lines below

    #end