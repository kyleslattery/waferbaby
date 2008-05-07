Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

$LOAD_PATH.unshift(Merb.root / "lib")

Merb::Config.use do |c|

        c[:session_secret_key]  = '1703bf9efcbb694541de2ce7c48b9406da71ac00'
        c[:session_store] = 'cookie'
        
end  

use_orm :datamapper
use_test :rspec

Merb::BootLoader.after_app_loads do
end
