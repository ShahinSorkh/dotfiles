#!/bin/bash

HAS_CONNECTED=$(ps aux | grep -v grep | grep -c openconnect 2>&1)

# 🔒 🔏 🔓 🔐 🔑 ⚿

if [ $HAS_CONNECTED != 0 ]; then
	echo 🔒
else
	echo 🔓
fi

