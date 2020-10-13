######################################################################
#<
#
# Function: p6df::modules::emacs::deps()
#
#>
######################################################################
p6df::modules::emacs::deps()    { 
	ModuleDeps=(
    p6m7g8/p6df-go
		p6m7g8/p6emacs
		magnars/.emacs.d
		hlissner/doom-emacs
		rmm5t/dotfiles
		NicolasPetton/emacs.d
	) 
}

######################################################################
#<
#
# Function: p6df::modules::emacs::langs()
#
#>
######################################################################
p6df::modules::emacs::langs() {
  ## .emacs.d
  
  # python

  # typescript

  # go
  go get github.com/rogpeppe/godef
  goenv rehash
}

######################################################################
#<
#
# Function: p6df::modules::emacs::external::brew()
#
#>
######################################################################
p6df::modules::emacs::external::brew() {

  brew tap daviderestivo/emacs-head
  brew install emacs-head --with-cocoa --with-imagemagick --with-multicolor-fonts --with-mailutils --with-dbus

  brew install mu
  brew install offlineimap
  brew install w3m
}

######################################################################
#<
#
# Function: p6df::modules::emacs::home::symlink()
#
#>
######################################################################
p6df::modules::emacs::home::symlink() {

  p6df::modules::emacs::home::choose "mine"
}

######################################################################
#<
#
# Function: p6df::modules::emacs::home::choose(config)
#
#  Args:
#	config - 
#
#>
######################################################################
p6df::modules::emacs::home::choose() {
  local config="$1"

  case $config in
      mine)    src=$P6_DFZ_SRC_P6M7G8_DIR/p6emacs ;;
      doom)    src=$P6_DFZ_SRC_DIR/hlissner/doom-emacs ;;
      magnars) src=$P6_DFZ_SRC_DIR/magnars/.emacs.d ;;
      rmm5t)   src=$P6_DFZ_SRC_DIR/rmm5t/dotfiles/emacs.d ;;
      tss)     src=$P6_DFZ_SRC_DIR/ananthakumaran/dotfiles/.emacs.d ;;
      nic)     src=$P6_DFZ_SRC_DIR/NicolasPetton/emacs.d ;;
  esac

  unlink $HOME/.emacs.d
  ln -fs $src $HOME/.emacs.d
}
    
######################################################################
#<
#
# Function: p6df::modules::emacs::init()
#
#>
######################################################################
p6df::modules::emacs::init() {

  alias ek="ps -efwww | awk '/[eE]macs/ { print \$2 }' | xargs kill -9"
}







#	If you're looking for even more integration with Go, namely
#	on-the-fly syntax checking, auto-completion and snippets, it is
#	recommended that you look at flycheck
#	\(see URL `https://github.com/flycheck/flycheck') or flymake in combination
#	with goflymake (see URL `https://github.com/dougm/goflymake'), gocode
#	\(see URL `https://github.com/nsf/gocode'), go-eldoc
#	\(see URL `github.com/syohex/emacs-go-eldoc') and yasnippet-go
#	\(see URL `https://github.com/dominikh/yasnippet-go')