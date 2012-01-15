Install
-------
Below will link all dotfiles in this repository into your home directory, but won't overwrtite any existing one

	git clone git://github.com/lessmind/dotfiles.git <clone path>
	cd <clone path>
	./install
	vi ~/.gitconfig

Dont forget to modify the [user] section in last command.

Uninstall
---------
This will remove all dotfile linked from this repository(make sure this repository in the **same place** when you run ./install.sh)

	cd <clone path>
	./install.sh