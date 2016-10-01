set :stage, :production
set :app_environment, "production"

set :ssh_options, { forward_agent: true, port: 22 }
set :branch, 'master'
set :deploy_to, '/home/deploy'

server '46.101.169.65', user: 'deploy', roles: %w{web app db}