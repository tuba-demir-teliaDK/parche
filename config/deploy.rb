set :application, "cheepar"
set :repository, "." 
set :scm, :none 
set :deploy_via, :copy 
set :use_sudo, false
default_run_options[:pty] = true

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "root"
server "ozcan.co", :app, :web, :db, :primary => true
set :deploy_to, "/home/ozcanco/cheepar"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end