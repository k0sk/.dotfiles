DOTFILES_PATTERN := $(wildcard .??*)
EXCLUDED_FILES := .DS_Store .git .gitignore .brew
DOTFILES_DIR := $(PWD)
DOTFILES := $(filter-out $(EXCLUDED_FILES), $(DOTFILES_PATTERN))

install:
	@$(foreach f, $(DOTFILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)

uninstall:
	@-$(foreach f, $(DOTFILES), rm -rfv $(HOME)/$(f);)

cleanup:
	-rm -rf $(DOTFILES_DIR)
