#!/bin/bash

HAS_CONNECTED=$(ip link show dev tun0 2>/dev/null)

# 🔒 🔏 🔓 🔐 🔑 ⚿

if [ "$HAS_CONNECTED" != "" ]; then
	echo -e 🔒
else
	echo -e 🔓
fi

