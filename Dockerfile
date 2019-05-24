FROM ubuntu:16.04

# Environment variables
ENV domain localhost
ENV LC_CTYPE en_US.UTF-8

# Setup scripts for LibreOffice Online
ADD /scripts/install-libreoffice.sh /
ADD /scripts/start-libreoffice.sh /
ADD /scripts/copycerts.sh /
RUN bash install-libreoffice.sh

EXPOSE 9980
RUN bash copycerts.sh
# Entry point
CMD bash start-libreoffice.sh
