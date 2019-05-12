p6df::modules::emacs::version() { echo "0.0.1" }
p6df::modules::emacs::deps()    {
	ModuleDeps=(p6m7g8/p6emacs)
}

p6df::modules::emacs::external::git() {

  git clone https://github.com/magnars/.emacs.d
  git clone https://github.com/hlissner/doom-emacs
}

p6df::modules::emacs::external::brew() {

  brew install emacs-head --with-cocoa --with-imagemagick --with-mailutils
  brew install mu
  brew install offlineimap
  brew install w3m
}

p6df::modules::emacs::home::symlink() {

  # XXX: .emacs.d + selection
  true;
}

p6df::modules::emacs::init() {

    alias ek="ps -efwww | awk '/[eE]macs/ { print \$2 }' | xargs kill -9"
}
