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

google-chrome-stable:
  pkgrepo.managed:
    - human_name: Google Chrome Repo
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
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
