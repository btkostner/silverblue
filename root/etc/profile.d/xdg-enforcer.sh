# shellcheck shell=sh

# /etc/profile.d/xdg-enforcer.sh - Enforces the use of the XDG Base Directory
#                                  spec. A lot of this was taken from
#                                  https://github.com/hyperupcall/dotfiles/blob/8bfc6159c355b03cb86517b22a2b0bbad963b090/os/unix/user/.config/shell/modules/xdg.sh
#                                  and extended from experienace and the Arch
#                                  wiki.

# Setup basic required envs
[ -z "$HOME" ] && return 0

[ -z "$XDG_CONFIG_HOME" ] && XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"
[ -z "$XDG_STATE_HOME" ] && XDG_STATE_HOME="$HOME/.local/state"
[ -z "$XDG_CACHE_HOME" ] && XDG_CACHE_HOME="$HOME/.cache"

# Functions
_path_prepend() {
	if [ -n "$2" ]; then
		case ":$(eval "printf '%s' \"\$$1\""):" in
			*":$2:"*) :;;
			*) eval "export $1=$2\${$1:+\":\$$1\"}" ;;
		esac
		return
	fi

	case ":$PATH:" in
		*":$1:"*) :;;
		*) export PATH="$1${PATH:+":$PATH"}"
	esac
}

# aws
export AWS_SHARED_CREDENTIALS_FILE="$XDG_STATE_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_STATE_HOME/aws/config"

# babel
export BABEL_CACHE_PATH="$XDG_CACHE_HOME/babel.json"

# bash-completion
export BASH_COMPLETION_USER_DIR="$XDG_CONFIG_HOME/bash"
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME/bash/bash_completion.sh"

# ccache
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME/ccache/config"

# curl
export CURL_HOME="$XDG_CONFIG_HOME/curl"

# dart
export PUB_CACHE="$XDG_CACHE_HOME/pub-cache"

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# docker-machine
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

# electrum
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"

# gdb
export GDBHISTFILE="$XDG_STATE_HOME/history/history"

# gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# grip
export GRIPHOME="$XDG_CONFIG_HOME/grip"

# gtk
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# hledger
export LEDGER_FILE="$XDG_STATE_HOME/hledger/hledger.journal"

# info
alias info='info --init-file $XDG_CONFIG_HOME/info/infokey'

# ipython
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"

# java
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_STATE_HOME/java"
export JAVA_TOOL_OPTIONS="-Djava.util.prefs.userRoot=$XDG_STATE_HOME/java"

# jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

# kde
export KDEHOME="$XDG_CONFIG_HOME/kde"

# maven
alias mvn='mvn -gs "$XDG_CONFIG_HOME/maven/settings.xml"'

# minikube
export MINIKUBE_HOME="$XDG_STATE_HOME/minikube"

# mplayer
export MPLAYER_HOME="$XDG_STATE_HOME/mplayer"

# mysql
export MYSQL_HISTFILE="$XDG_STATE_HOME/history/mysql_history"

# node
export NODE_REPL_HISTORY="$XDG_STATE_HOME/history/node_repl_history"
export TS_NODE_HISTORY="$XDG_STATE_HOME/history/ts_node_repl_history"

# node-gyp
export npm_config_devdir="$XDG_STATE_HOME/node-gyp"

# node-spawn-wrap
export SPAWN_WRAP_SHIM_ROOT="$XDG_STATE_HOME/node-spawn-wrap"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# nuget
export NUGET_PACKAGES="$XDG_DATA_HOME/nuget/packages"

# packer
export PACKER_CONFIG="$XDG_DATA_HOME/packer/packerconfig"
export PACKER_CONFIG_DIR="$XDG_DATA_HOME/packer/packer.d"

# pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# pipx
export PIPX_HOME="$XDG_STATE_HOME/pipx/virtualenv"
export PIPX_BIN_DIR="$XDG_STATE_HOME/pipx/bin"

# postgresql
export PSQLRC="$XDG_DATA_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/history/psql_history"
export PGPASSFILE="$XDG_DATA_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_DATA_HOME/pg/pg_service.conf"

# pylint
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export PYLINTRC="$XDG_CONFIG_HOME/pylint/config"

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py" # https://github.com/python/cpython/pull/13208
export PYTHON_EGG_CACHE="$XDG_CACHE_HOME/python-eggs"

# redis
export REDISCLI_RCFILE="$XDG_CONFIG_HOME/redis/redisclirc"
export REDISCLI_HISTFILE="$XDG_STATE_HOME/history/redis_history"

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
_path_prepend "$CARGO_HOME/bin"

# ruby-build
export RUBY_BUILD_CACHE_PATH="$XDG_CACHE_HOME/ruby-build"

# sqlite
export SQLITE_HISTORY="$XDG_STATE_HOME/history/sqlite_history"

# tree-sitter
export TREE_SITTER_DIR="$XDG_CONFIG_HOME/tree-sitter"

# vagrant
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$VAGRANT_HOME/aliases"

# urxvt
export URXVT_PERL_LIB="$XDG_CONFIG_HOME/urxvt/ext"
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd

# wasmer
export WASMER_DIR="$XDG_DATA_HOME/wasmer"

# wasmtime
export WASMTIME_HOME="$XDG_DATA_HOME/wasmtime"
_path_prepend "$WASMTIME_HOME/bin"

# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# wine
export WINEPREFIX="$XDG_DATA_HOME/wine"

# yarn
export YARN_CACHE_FOLDER="$XDG_CACHE_HOME/yarn"
_path_prepend "$HOME/.yarn/bin"

# z
export _Z_DATA="$XDG_DATA_HOME/z"

unset -f _path_prepend
