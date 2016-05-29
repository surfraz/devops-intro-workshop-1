############################################################
# Dockerfile to build a Sinatra Application
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM phusion/baseimage:0.9.18

# File Author / Maintainer
MAINTAINER Surfraz Ahmed

# Update local package indexes
RUN apt-get update -y

# Install packages for building ruby
RUN apt-get install -y --force-yes build-essential wget git
RUN apt-get install -y --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean

# Install ruby repos (from brightbox)
RUN apt-get install -y --force-yes software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update

RUN apt-get install -y --force-yes ruby2.2 ruby2.2-dev ruby-switch
RUN ruby-switch --set ruby2.2

RUN gem update --system
RUN gem install bundler

# Copy the application folder inside the container
ADD /my_application /my_application

# Expose ports
EXPOSE 8080

# Set the default directory where CMD will execute
WORKDIR /my_application

# Install required gems using bundler
RUN bundle install

# Set the default command to execute    
# when creating a new container
CMD bundle exec rackup --port 8080 --host 0.0.0.0
