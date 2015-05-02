DOTFILES_PATTERN := $(wildcard .??*)
EXCLUDED_FILES := .DS_Store .git .gitignore .gitmodules .brew
DOTFILES_DIR := $(PWD)
DOTFILES := $(filter-out $(EXCLUDED_FILES), $(DOTFILES_PATTERN))

help:
	@echo "make list       #=> List dotfiles"
	@echo "make init       #=> Setup environment"
	@echo "make xcode      #=> Install Xcode Command Line Tools"
	@echo "make homebrew   #=> Install Homebrew"
	@echo "make install    #=> Create symlinks"
	@echo "make uninstall  #=> Delete symlinks"
	@echo "make update     #=> Update repositories"
	@echo "make cleanup    #=> Remove the dotfiles"

list:
	@$(foreach f, $(DOTFILES), ls -dF $(f);)

init:
	@$(foreach f, $(wildcard ./etc/init/*.sh), bash $(f);)
ifeq ($(shell uname), Darwin)
	@$(foreach f, $(wildcard ./etc/init/osx/*.sh), bash $(f);)

xcode:
	@bash $(DOTFILES_DIR)/etc/init/osx/_install_xcode_cli.sh

homebrew:
	@bash $(DOTFILES_DIR)/etc/init/osx/install_homebrew.sh
endif

install:
	@$(foreach f, $(DOTFILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)

uninstall:
	@-$(foreach f, $(DOTFILES), rm -rfv $(HOME)/$(f);)

update:
	git pull --rebase origin master
	git submodule update --recursive

cleanup:
	-rm -rf $(DOTFILES_DIR)
