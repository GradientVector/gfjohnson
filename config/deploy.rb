# RVM
require "rvm/capistrano"
set :rvm_ruby_string, :local

# Bundler
require "bundler/capistrano"

# General
set :application, "gfjohnson"
set :user, "john"

set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :copy

set :use_sudo, false

# Git
set :scm, :git
set :repository,  "~/GitHub/#{application}/.git"
set :branch, "master"

# VPS
role :web, "184.82.197.13"
role :app, "184.82.197.13"
role :db,  "184.82.197.13", :primary => true
role :db,  "184.82.197.13"

# Passenger
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end
