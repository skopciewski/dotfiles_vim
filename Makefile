VIM_DIR := $(HOME)/.vim
VIM_PACK_DIR := $(VIM_DIR)/pack/base/start
VIM_PLUGIN_DIR := $(VIM_DIR)/plugin
VIM_CONFIG := $(HOME)/.vimrc

install: prepare_vim

# link current dot file to the home dir
$(HOME)/%: %
	@ln -fs $(PWD)/$< $@

# check specific comand
check_cmd_%:
	@if ! which $* &>/dev/null; then \
		echo "!! Missing $*"; \
		exit 1; \
	fi

# for vim
prepare_vim: check_vim_deps deploy_vim_configs $(VIM_PACK_DIR)

check_vim_deps: check_cmd_git check_cmd_ack

deploy_vim_configs: $(VIM_PLUGIN_DIR) $(VIM_CONFIG)

$(VIM_PLUGIN_DIR): plugin/configs/*.vim
	@mkdir -p $@
	@cp -r plugin/ $@

$(VIM_PACK_DIR): clean_plugins vim_plugins.txt
	@mkdir -p $@
	@for plugin in $$(cat ./vim_plugins.txt); do \
		echo "*** Installing: $${plugin} ***"; \
		$$(cd $(VIM_PACK_DIR) && git clone $${plugin} 2>/dev/null || true); \
	done

clean_plugins:
	@for name in $$(find $(VIM_PACK_DIR) -maxdepth 1 -mindepth 1 -exec basename {} \;); do \
		if ! grep -q "$${name}.git$$" ./vim_plugins.txt; then \
			echo "*** Removing: $${name} ***"; \
			rm -rf $(VIM_PACK_DIR)/$${name}; \
		fi; \
	done

.PHONY: install prepare_vim check_vim_deps deploy_vim_configs clean_plugins
