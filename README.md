Install
-------
Below will link all dotfiles in this repository into your home directory, but won't overwrtite any existing one

	git clone git://github.com/lessmind/dotfiles.git <clone path>
	cd <clone path>
	./configure setup
	vi ~/.gitconfig

Don't forget to modify the [user] section in last command.

To make Syntastic check in JavaScript work, install [jshint](https://github.com/jshint/jshint).

Quick Install
---------------
This instruction will install this project into your ~/dotfiles and overwrtite all your current settings. (origin settings will backup to ~/dotfiles\_bak)

	mkdir -p ~/dotfiles && cd ~/dotfiles && wget https://github.com/downloads/lessmind/dotfiles/pack.tar.gz \
	&& tar -xvf pack.tar.gz && rm pack.tar.gz && git checkout master \
	&& git fetch origin && git pull origin master && ./configure setup

Quick reinstall
---------------
In case that git pull can't update the submodules when its source have been changed, here's a quick one line reinstall instruction if you install this repository in ~/dotfiles

	rm -rf ~/dotfiles && mkdir -p ~/dotfiles && cd ~/dotfiles \
	&& wget https://github.com/downloads/lessmind/dotfiles/pack.tar.gz \
	&& tar -xvf pack.tar.gz && rm pack.tar.gz && git checkout master \
	&& git fetch origin && git pull origin master && ./configure reset

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
