clipit:
  pkg.installed

curl:
  pkg.installed

docker:
  pkg.installed

fish:
  pkg.installed

git:
  pkg.installed

htop:
  pkg.installed

keypassx:
  pkg.installed

ntp:
  pkg.installed

nvim:
  pkg.installed

python-dev:
  pkg.installed

python-pip:
  pkg.installed

terminator:
  pkg.installed

tmux:
  pkg.installed

unity-tweak-tool:
  pkg.installed

virtualenvwrapper:
  pip.installed:
    - require:
      - pkg: python-pip

xclip:
  pkg.installed

zsh:
  pkg.installed
