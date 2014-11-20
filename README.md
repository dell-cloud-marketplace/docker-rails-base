#docker-rails
This is a base Docker image to run [Ruby on Rails](http://rubyonrails.org/) - is an open-source web application framework written in [Ruby]( https://www.ruby-lang.org/en/). The base image provides  a starting point in building Rails web applications.



## Components
The software stack comprises the following components:

Name          | Version    | Description
--------------|------------|------------------------------
Ubuntu        | Trusty     | Operating system
Ruby          | 2.1.4      | Programming language
Ruby on Rails | 4.1.6      | Web application framework

## Usage

### Start the container

To start your container with:

* A named container ("rails")

Do:

    sudo docker run -d -name rails dell/rails


### Image Details

Pre-built Image   | [https://registry.hub.docker.com/u/dell/rails](https://registry.hub.docker.com/u/dell/rails) 
