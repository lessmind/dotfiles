#!/bin/bash
set -e
for plugin in $(ls -p | grep /); do
	echo "......updating ${plugin}"
	cd ${plugin} && git fetch origin && git checkout origin/master -qf && cd ..
done
