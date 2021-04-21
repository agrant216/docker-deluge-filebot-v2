FROM binhex/arch-delugevpn:latest
MAINTAINER agrant216

# install filebot
#############
RUN curl -fsSL "https://repo.archlinuxcn.org/x86_64/glibc-linux4-2.33-4-x86_64.pkg.tar.zst" | bsdtar -C / -xvf -

RUN pacman -Syyu --noconfirm jre11-openjdk-headless sudo

RUN mkdir filebot && cd filebot

ADD filebot.sh /

RUN chmod +x filebot.sh

RUN /filebot.sh

#RUN ln -sf /filebot/filebot.sh /usr/bin/filebot

# Entrypoint
#################

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/usr/local/bin/init.sh"]
