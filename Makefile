VIM_DIR := $(HOME)/.vim
VIM_PACK_DIR := $(VIM_DIR)/pack/base/start
VIM_PLUGIN_DIR := $(VIM_DIR)/plugin
VIM_SPELL_DIR := $(VIM_DIR)/spell
VIM_CONFIG := $(HOME)/.vimrc

install: prepare_vim

# link current dot file to the home dir
$(HOME)/%: %
	@ln -fs $(PWD)/$< $@

# check specific command
check_cmd_%:
	@if ! which $* &>/dev/null; then \
		echo "!! Missing $*"; \
		exit 1; \
	fi

# for vim
prepare_vim: check_vim_deps deploy_vim_configs download_vim_dics manage_vim_plugins

check_vim_deps: check_cmd_git check_cmd_ack check_cmd_curl

deploy_vim_configs: $(VIM_DIR) $(VIM_PLUGIN_DIR) $(VIM_CONFIG)

$(VIM_DIR):
	mkdir -p $(VIM_DIR)/swap
	mkdir -p $(VIM_DIR)/undo

$(VIM_PLUGIN_DIR): plugin/configs/*.vim plugin/*.vim
	@mkdir -p $@
	@cp -r plugin/* $@

download_vim_dics: $(VIM_SPELL_DIR)/pl.utf-8.spl $(VIM_SPELL_DIR)/en.utf-8.spl

$(VIM_SPELL_DIR)/%: $(VIM_SPELL_DIR)
	@echo "*** Install lang packs ***"
	@curl -o $@ -fsSL "ftp://ftp.vim.org/pub/vim/runtime/spell/$*"

$(VIM_SPELL_DIR):
	@mkdir -p $@

manage_vim_plugins: clean_plugins install_plugins

install_plugins: $(VIM_PACK_DIR) vim_plugins.txt
	@for plugin in $$(cat ./vim_plugins.txt); do \
		echo "*** Installing: $${plugin} ***"; \
		$$(cd $(VIM_PACK_DIR) && git clone $${plugin} 2>/dev/null || true); \
	done


clean_plugins: $(VIM_PACK_DIR) vim_plugins.txt
	@for name in $$(find $(VIM_PACK_DIR) -maxdepth 1 -mindepth 1 -exec basename {} \;); do \
		if ! grep -q "$${name}.git$$" ./vim_plugins.txt; then \
			echo "*** Removing: $${name} ***"; \
			rm -rf $(VIM_PACK_DIR)/$${name}; \
		fi; \
	done

$(VIM_PACK_DIR):
	@mkdir -p $@

.PHONY: install prepare_vim check_vim_deps deploy_vim_configs download_vim_dics manage_vim_plugins install_plugins clean_plugins
