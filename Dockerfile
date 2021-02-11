FROM rocker/shiny

# system libraries of general use
## install debian packages
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libv8-dev \
    libmagick++-dev 
#    openjdk-11-jdk  \
#    liblzma-dev \
#    libbz2-dev \
#    tcl8.6-dev \
#    tk8.6-dev



COPY /docker_save_load_app /srv/shiny-server/load_image_sample


# expose port
EXPOSE 3838

# allow permission
RUN sudo chown -R shiny:shiny /srv/shiny-server

# run app
CMD ["/usr/bin/shiny-server.sh"]