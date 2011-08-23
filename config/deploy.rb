set :application, "moseller.com"
set :repository,  "git@github.com:sanjuro/MoSeller.git"

default_run_options[:pty] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/bitnami/#{application}"

role :web, "ec2-50-17-132-6.compute-1.amazonaws.com"                          # Your HTTP server, Apache/etc
role :app, "ec2-50-17-132-6.compute-1.amazonaws.com"                          # This may be the same as your `Web` server
role :db,  "ec2-50-17-132-6.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run


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

ssh_options[:user] = 'bitnami'
  
# ssh_options[:keys] =  %w(/home/bitnami/id_rsa)
  

set :user, "bitnami"  # The server's user for deploys

set :branch, "master"
  

# set :use_sudo, true

set :keep_releases,  3