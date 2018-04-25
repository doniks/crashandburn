# crashandburn
A script and systemd service to trigger a kernel crash

Intended to support the porting process in Halium (http://halium.org/). 

Newer kernels use the pstore and ramoops drivers to store kernel logs after a panic (https://docs.halium.org/en/latest/porting/debug-build/dmesg.html#id1). However, if the device is just sitting there, and you can't get ssh/telnet/adb access, but it isn't panicking either, you are stuck. With this systemd service the kernel WILL panic after 60 seconds. Afterwards you can reboot into recovery and retrieve the log. 

To install:
 * Boot into recovery
 * Chroot into the rootfs 
 * copy the .service file into /etc/systemd/system/crashandburn.service 
 * copy the .sh file into /usr/bin/ 
 * systemctl enable crashandburn
 * now reboot into your rootfs
 * the led should emit a "breathe" when the service is started
 * 60 seconds later the led should blink
 * now the kernel should crash
 * be prepared to bring the device into recovery now (some key combination)
 * once in recovery, retrieve the log
 * optionally, once you fixed your port, you could consider deleting the files, but that's totally up to you ;)

