# config valid only for Capistrano 3.1
lock '3.6.1'

set :application, 'dhc'
set :scm, :git
set :repo_url, 'https://github.com/AkPeter/dhc.git'

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :bundle_binstubs, nil
set :passenger_restart_with_touch, true

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end
