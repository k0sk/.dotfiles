EXCLUDED_FILES := .DS_Store .git .gitignore .gitmodules .brew
DOTFILES := $(filter-out $(EXCLUDED_FILES), $(wildcard .??*))
BINFILES := $(filter-out $(EXCLUDED_FILES), $(wildcard ./bin/*))

help:
	@echo "make list       #=> List dotfiles/bin"
	@echo "make init       #=> Setup environment"
	@echo "make xcode      #=> Install Xcode Command Line Tools"
	@echo "make homebrew   #=> Install Homebrew"
	@echo "make install    #=> Create symlinks"
	@echo "make uninstall  #=> Delete symlinks"
	@echo "make update     #=> Update repositories"

list:
	@echo "--- dotfiles ---"
	@$(foreach f, $(DOTFILES), ls -dF $(f);)
	@echo "--- bin ---"
	@$(foreach f, $(BINFILES), ls -dF $(f);)

init:
	@$(foreach f, $(wildcard ./etc/init/*.sh), bash $(f);)
ifeq ($(shell uname), Darwin)
	@$(foreach f, $(wildcard ./etc/init/osx/*.sh), bash $(f);)

xcode:
	@bash $(DOTFILES_DIR)/etc/init/osx/install_xcode_cli.sh

homebrew:
	@bash $(DOTFILES_DIR)/etc/init/osx/install_homebrew.sh
endif

install:
	@$(foreach f, $(DOTFILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)
	@$(foreach f, $(BINFILES), ln -sfnv $(abspath $(f)) /usr/local/bin/$(notdir $(f));)

uninstall:
	@-$(foreach f, $(DOTFILES), rm -rfv $(HOME)/$(f);)
	@-$(foreach f, $(BINFILES), rm -rfv /usr/local/bin/$(notdir $(f));)

update:
	git pull --rebase origin master
	git submodule update --init --recursive
