require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'

set :rbenv_custom_path, '/home/deploy/.rbenv/'
set :rbenv_ruby, '2.1.2'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
