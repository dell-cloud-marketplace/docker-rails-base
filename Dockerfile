FROM ubuntu:trusty
MAINTAINER Dell Cloud Market Place <Cloud_Marketplace@dell.com>

# Set environment variable for package install
ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update && apt-get install -yq \
   build-essential \
   libcurl4-openssl-dev \
   libffi-dev \
   libreadline-dev \
   libssl-dev \
   libxml2-dev \
   libxslt1-dev \
   libyaml-dev \
   python-software-properties \
   zlib1g-dev

# Ensure UTF-8
RUN locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    export LC_ALL=en_US.UTF-8 && \
    export LANGUAGE=en_US.UTF-8 && \
    export LANG=en_US.UTF-8

# Clean package cache
RUN apt-get -y clean && rm -rf /var/lib/apt/lists/*


# Install Ruby
ADD http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.1.tar.gz /tmp/
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

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install Ruby Gems
RUN gem install bundler

# Install Rails
RUN gem install rails -v 4.2