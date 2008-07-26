set :application,       "waferbaby"
set :branch,            "master"
set :deploy_to,         "/usr/local/www/apps/#{application}"
set :deploy_via,        :remote_cache
set :repository,        "daniel@waferbaby.com:/usr/local/code/waferbaby.git"
set :runner,            "daniel"
set :scm,               :git
set :user,              "daniel"
set :use_sudo,          false

role :app, "waferbaby.com"
role :db,  "waferbaby.com", :primary => true
role :web, "waferbaby.com"

namespace :deploy do  
        desc "Link up the database.yml file."
        task :after_update_code do
                run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
        end
        
        desc "Restart Merb."
        task :restart, :roles => :app do
                run "cd /usr/local/www/apps/waferbaby/current;/usr/local/bin/merb -K all"
                run "/usr/local/bin/merb -d -a thin -e production -m /usr/local/www/apps/waferbaby/current"
        end
end