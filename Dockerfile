# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.10.1

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN sudo add-apt-repository ppa:chris-lea/redis-server -y
RUN sudo add-apt-repository ppa:brightbox/ruby-ng -y
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN apt install -y -qq redis-server ruby2.5 ruby2.5-dev
RUN apt install -y -qq ruby ruby-dev ruby-switch
# watermark 
RUN apt install -y figlet
RUN figlet TIGEFA

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*