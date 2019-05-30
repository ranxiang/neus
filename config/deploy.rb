# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, "neus"
set :repo_url, "git@github.com:ranxiang/neus.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, ENV['NEUS_DEPLOY_TO']

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor/bundle", "public/system", "public/uploads"

# Default value for default_env is {}
set :default_env, { rails_env: "production" }


# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :rvm_ruby_version, 'ruby-2.6.3@neus'

set :nginx_server_name, ENV['NEUS_DEPLOY_NGINX_SERVER_NAME']

set :nginx_ssl_certificate, ENV['NEUS_DEPLOY_NGINX_SSL_CERTIFICATE']

set :nginx_ssl_certificate_key, ENV['NEUS_DEPLOY_NGINX_SSL_CERTIFICATE_KEY']

set :nginx_use_ssl, true


# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
