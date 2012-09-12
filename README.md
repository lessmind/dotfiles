Install
-------
Below will link all dotfiles in this repository into your home directory, but won't overwrtite any existing one

	git clone git://github.com/lessmind/dotfiles.git <clone path>
	cd <clone path>
	./configure setup
	vi ~/.gitconfig

Don't forget to modify the [user] section in last command.

To make Syntastic check in Javascript work, install [jshint](https://github.com/jshint/jshint).

Uninstall
---------
This will remove all dotfile linked from this repository(make sure this repository in the **same place** when you run **./configure setup**)

	cd <clone path>
	./configure remove

Vim plugins
-----------
You could easily enable or disable specified plugins by modify the symbolic links in vim/bundle, this is useful to setup different developing environment without handling complicated submodules.

For disable

	rm vim/bundle/[plugin]

For enable

	cd vim/bundle && link -s ../../bundle/[plugin] ./

Quick reinstall
---------------
In case that git pull can't update the submodules when its source have been changed, here's a quick one line reinstall instruction if you install this repository in ~/dotfiles

Without write access

	cd ~ && rm -rf dotfiles && git clone git://github.com/lessmind/dotfiles.git && cd dotfiles && ./configure reset

With write access

	cd ~ && rm -rf dotfiles && git clone git@github.com:lessmind/dotfiles && cd dotfiles && ./configure reset

Todo
----
Add auto package script to prevent clone all submodules every time
