Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

Merb::BootLoader.after_app_loads do
end

Merb::Config.use do |c|
        c[:session_secret_key]  = '1703bf9efcbb694541de2ce7c48b9406da71ac00'
        c[:session_store]       = 'datamapper'
end

use_orm         :datamapper
use_test        :rspec

dependencies    'BlueCloth',
                'dm-validations',
                'dm-timestamps',
                'merb-action-args',
                'merb-assets',
                'merb_helpers',
                'merb-parts',
                'lib/string_extensions',
                'lib/timestamp_extensions'