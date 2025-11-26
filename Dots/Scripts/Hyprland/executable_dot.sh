#!/bin/bash

modprobe -r ec_sys
modprobe ec_sys write_support=1
echo -n -e "\x0a" | dd of="/sys/kernel/debug/ec/ec0/io" bs=1 seek=12 count=1 conv=notrunc 2>/dev/null
modprobe -r ec_sys
