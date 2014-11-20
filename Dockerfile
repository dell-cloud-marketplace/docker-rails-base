FROM ubuntu:trusty
MAINTAINER Dell Cloud Market Place <Cloud_Marketplace@dell.com>


# Set environment variable for package install
ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update && apt-get install -yq \
   zlib1g-dev \
   build-essential \
   libssl-dev \
   libreadline-dev \
   libyaml-dev \
   libxml2-dev \
   libcurl4-openssl-dev \
   python-software-properties  


# Install Ruby
ADD http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz /tmp/
RUN \
  cd /tmp && \
  tar -xzvf ruby-*.tar.gz && \
  rm -f ruby-*.tar.gz && \
  cd ruby-* && \
  ./configure --disable-install-doc && \
  make && \
  make install && \
  cd .. && \
  rm -rf ruby-*


echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install Ruby Gems
RUN gem install bundler

# Install Rails
RUN gem install rails -v 4.1.6

# Expose Rails server port
EXPOSE 3000 
