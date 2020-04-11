FROM binhex/arch-delugevpn:latest
MAINTAINER agrant216

# install filebot
#############

RUN pacman -Syyu --noconfirm jre8-openjdk-headless sudo

RUN mkdir filebot && cd filebot

RUN sh -xu <<< "$(curl -fsSL https://raw.githubusercontent.com/filebot/plugins/master/installer/tar.sh)"

RUN ln -sf /filebot/filebot.sh /usr/bin/filebot

# Entrypoint
#################

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/usr/local/bin/init.sh"]