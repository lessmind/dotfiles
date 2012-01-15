Install
-------

Start

	git clone git://github.com/lessmind/dotfiles.git <your path>
	cd <your path>

Under ubuntu or fedora

	git checkout unix

Under Mac OS X

	git checkout mac

After above

	./install mac # Or use unix instead
	vi ~/.gitconfig # Modify the [user] section

Uninstall
---------

This will remove all dotfile linked from here

	cd <your path>
	./install.sh mac -u # Or use unix instead

Usage
-----

When in vim

- press F2 to toggle NERDTreeTabs
- press F3 to toggle Tagbar
