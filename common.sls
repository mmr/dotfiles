apt-transport-https:
  pkg.installed

clipit:
  pkg.installed

curl:
  pkg.installed

debconf-utils:
  pkg.installed

docker-pkg:
  pkgrepo.managed:
    - humanname: Docker Repo
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains.oscodename }} stable
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/ubuntu/gpg
    - clean_file: True
    - order: 1
    - require:
      - pkg: apt-transport-https
  pkg.installed:
    - name: docker-ce
    - fromrepo: xenial
    - refresh: True

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
  pkg.installed:
    - name: google-chrome-stable

htop:
  pkg.installed

keepassx:
  pkg.installed

ntp:
  pkg.installed

neovim:
  pkgrepo.managed:
    - ppa: neovim-ppa/stable
  pkg.installed:
    - name: neovim
    - refresh: True

oracle-java8-installer:
  pkgrepo.managed:
    - ppa: webupd8team/java
  pkg.installed:
    - require:
      - pkgrepo: oracle-java8-installer
  debconf.set:
   - data:
       'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': True}
   - require_in:
       - pkg: oracle-java8-installer

python-dev:
  pkg.installed

python-pip:
  pkg.installed

#terminator:
#  pkg.installed

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
