p6df::modules::emacs::version() { echo "0.0.1" }
p6df::modules::emacs::deps()    { 
	ModuleDeps=()
}

p6df::modules::emacs::external::git() {
  
  git clone https://github.com/magnars/.emacs.d
  git clone https://github.com/hlissner/doom-emacs
  git clone https://github.com/pgollucci/emacs
}

p6df::modules::emacs::external::brew() {

  brew install mu --with-emacs

  brew tap d12frosted/emacs-plus
  brew install emacs-plus --without-spacemacs-icon 

  brew install offlineimap

  brew install w3m
}

p6df::modules::emacs::init() {

    alias ek="ps -efwww | awk '/[eE]macs/ { print \$2 }' | xargs kill -9"
}
