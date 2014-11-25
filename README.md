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


## Database Integration
Database of your choice can easily be added to your rails application. SQLite can be used for development otherwise for production the preferred database choices are MySQL and PostgreSQL. Below are MySQL and PostgreSQL integration for your reference, the intergration takes the perspective of running the commands within the container.

### MySQL

Install the MySQL database server and required libraries:

    sudo apt-get install mysql-server libmysqlclient-dev
    
To install MySQL adapter mysql2 from within the container, do:

    gem install mysql2
    
Adding MySQL as the default database on creation of a Rails application will create the database.yml and add the correct database gem in your Gemfile. To create a new rails application with MySQL as the database run the following command from within the container:

    rails new application -d mysql
    
An example of application/config/database.yml:

```no-highlight
development:
adapter: mysql
encoding: utf8
database: app_development
username: root
password:
socket: /tmp/mysql.sock
```

### PostgreSQL

Install the PostgreSQL database server and required libraries:

    sudo apt-get install postgresql libpq-dev
    
To install PostgreSQL adapter pg from within the container, do:

    gem install pg
    
Adding PostgreSQL as the default database on creation of a Rails application will create the database.yml and add the correct database gem in your Gemfile. To create a new rails application with MySQL as the database run the following command from within the container:

    rails new application -d postgresql
    
An example of application/config/database.yml:

```no-highlight
development:
adapter: postgresql
encoding: utf8
database: app_development
username: root
password:
```

## Reference

### Image Details

Pre-built Image   | [https://registry.hub.docker.com/u/dell/rails](https://registry.hub.docker.com/u/dell/rails) 
