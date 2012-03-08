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
This will remove all dotfile linked from this repository(make sure this repository in the **same place** when you run ./cconfigure)

	cd <clone path>
	./configure remove