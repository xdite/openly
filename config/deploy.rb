# -*- encoding : utf-8 -*-
require "./config/boot"
require "bundler/capistrano"


default_environment["RAILS_ENV"] = "production"
default_environment["PATH"] = "/usr/local/bin:/usr/bin:/bin"

set :application, "openly"
set :repository,  "git@github.com:xdite/openly.git"

set :branch, "master"
set :scm, :git
set :user, "apps"
set :deploy_to, "/home/apps/#{application}"
set :runner, "apps"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1


role :web, "rocodev.com"                          # Your HTTP server, Apache/etc
role :app, "rocodev.com"                          # This may be the same as your `Web` server
role :db,  "rocodev.com", :primary => true # This is where Rails migrations will run


namespace :deploy do

  desc "Restart passenger process"
  task :restart, :roles => [:web], :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


namespace :my_tasks do
  task :symlink, :roles => [:web] do
    run "mkdir -p #{deploy_to}/shared/log"
    run "mkdir -p #{deploy_to}/shared/pids"
    
    symlink_hash = {
      "#{shared_path}/config/database.yml"   => "#{release_path}/config/database.yml",
      "#{shared_path}/uploads"              => "#{release_path}/public/uploads",
    }

    symlink_hash.each do |source, target|
      run "ln -sf #{source} #{target}"
    end
  end

end



namespace :remote_rake do
  desc "Run a task on remote servers, ex: cap staging rake:invoke task=cache:clear"
  task :invoke do
    run "cd #{deploy_to}/current; RAILS_ENV=#{rails_env} bundle exec rake #{ENV['task']}"
  end
end

after "deploy:finalize_update", "my_tasks:symlink"
#after "deploy:update_code", "delayed_job:restart"
