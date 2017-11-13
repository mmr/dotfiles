mmr:
  user.present:
    - fullname: Marcio Ribeiro
    - shell: /usr/bin/fish
    - uid: 1000
    - gid: 1000
    - groups:
      - sudo
      - docker

~mmr/.bashrc:
  file.managed:
    - source: salt://files/dot.bashrc
    - user: mmr
    - group: mmr
    - file_mode: 600

~mmr/.gitconfig:
  file.managed:
    - source: salt://files/dot.gitconfig
    - user: mmr
    - group: mmr
    - file_mode: 600

~mmr/.config/nvim/init.vim:
  file.managed:
    - source: salt://files/init.vim
    - user: mmr
    - group: mmr
    - file_mode: 600
    - makedirs: True

vim_symlink_config:
  file.symlink:
    - name: ~mmr/.vimrc
    - target: .config/nvim/init.vim
    - force: True
    - user: mmr
    - group: mmr
    - makedirs: True

# vim-plug (neovim)
# TODO (mmr) : turn this into a salt formula
{% set plug_path = '.local/share/nvim/site/autoload/plug.vim' %}
{% set plug_plugins_path = '.local/share/nvim/plugged' %}
vim_plug:
  cmd.run:
    - name: curl -fLo ~mmr/{{ plug_path }} --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - unless: test -f ~mmr/{{ plug_path }}
    - runas: mmr

vim_symlink_plug:
  file.symlink:
    - name: ~mmr/.vim/autoload/plug.vim
    - target: ../../{{ plug_path }}
    - force: True
    - user: mmr
    - group: mmr
    - makedirs: True

vim_symlink_plugins:
  file.symlink:
    - name: ~mmr/.vim/plugged
    - target: ../{{ plug_plugins_path }}
    - force: True
    - user: mmr
    - group: mmr
    - makedirs: True

# Install plugins using vim.basic to force sync install
vim_install_plugins:
  cmd.run:
    - name: vim.basic +PlugInstall +qall
    - runas: mmr
    - require:
      - vim_plug
      - vim_symlink_plug
      - vim_symlink_plugins
