export KBUILD_BUILD_USER="HaWk-EyE"
export KBUILD_BUILD_HOST="ubuntu"
export CROSS_COMPILE="${PWD}/toolchain/bin/aarch64-linux-android-"
gtc=1

read -p "Do you want to clean? (y) " clean
[ "$clean" = "y" ] && {
[ ! -d toolchain ] && { read -p "Do you need toolchain? (y) " tool
gtc=0
[ "$tool" = "y" ] && git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 toolchain 
}
make clean && make mrproper
rm -rf out ; mkdir out
[ "$gtc" == 1 ] && {
read -p "Do you need toolchain? (y) " tool
[ -d toolchain ] && rm -rf toolchain
[ "$tool" = "y" ] && git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 toolchain 
}
}

make ARCH=arm64 O=out yl6735m_65u_ov_m_defconfig ; make ARCH=arm64 -j30 O=out
