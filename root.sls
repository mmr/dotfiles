/root/.bashrc:
  file.managed:
    - source: salt://files/dot.bashrc
    - user: root
    - group: root
    - file_mode: 600

/root/.vimrc:
  file.managed:
    - source: salt://files/dot.vimrc
    - user: root
    - group: root
    - file_mode: 600
