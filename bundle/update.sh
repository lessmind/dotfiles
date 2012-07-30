#!/bin/bash
for plugin in $(ls -p | grep /); do
	echo "updating ${plugin}"
	cd ${plugin} && git checkout master && cd ..
done
