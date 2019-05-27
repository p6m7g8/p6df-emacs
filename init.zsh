p6df::modules::emacs::version() { echo "0.0.1" }
p6df::modules::emacs::deps()    { 
	ModuleDeps=(
		p6m7g8/p6emacs
		magnars/.emacs.d
		hlissner/doom-emacs
		rmm5t/dotfiles
	) 
}

p6df::modules::emacs::langs() {
  # .emacs.d
  go get github.com/rogpeppe/godef
#	If you're looking for even more integration with Go, namely
#	on-the-fly syntax checking, auto-completion and snippets, it is
#	recommended that you look at flycheck
#	\(see URL `https://github.com/flycheck/flycheck') or flymake in combination
#	with goflymake (see URL `https://github.com/dougm/goflymake'), gocode
#	\(see URL `https://github.com/nsf/gocode'), go-eldoc
#	\(see URL `github.com/syohex/emacs-go-eldoc') and yasnippet-go
#	\(see URL `https://github.com/dominikh/yasnippet-go')
}

p6df::modules::emacs::external::brew() {

  brew tap daviderestivo/emacs-head
  brew install emacs-head --with-cocoa --with-imagemagick --with-multicolor-fonts --with-mailutils --with-dbus

  brew install mu
  brew install offlineimap
  brew install w3m
}

p6df::modules::emacs::home::symlink() {

  ln -fs $P6_DFZ_SRC_P6M7G8_DIR/p6emacs .emacs.d
}

p6df::modules::emacs::init() {

  alias ek="ps -efwww | awk '/[eE]macs/ { print \$2 }' | xargs kill -9"
}
