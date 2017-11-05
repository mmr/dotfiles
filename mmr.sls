mmr:
  user.present:
    - fullname: Marcio Ribeiro
    - shell: /bin/bash
    - home: /home/mmr
    - uid: 1000
    - gid: 1000
    - groups:
      - sudo
      - docker

/home/mmr/.bashrc:
  file.managed:
    - source: salt://files/dot.bashrc
    - user: mmr
    - group: mmr
    - file_mode: 600

/homr/mmr/.vimrc:
  file.managed:
    - source: salt://files/dot.vimrc
    - user: mmr
    - group: mmr
    - file_mode: 600
