#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.skyterecore/skytered.pid file instead
skytere_pid=$(<~/.skyterecore/testnet3/skytered.pid)
sudo gdb -batch -ex "source debug.gdb" skytered ${skytere_pid}
