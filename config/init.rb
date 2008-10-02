$KCODE = 'UTF8'

Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

use_orm                         :datamapper
use_test                        :rspec
use_template_engine             :haml

Merb::BootLoader.before_app_loads do
        Merb.add_mime_type(:atom, :to_atom, %w[application/atom+xml])
end

dependency      'dm-aggregates'
dependency      'dm-timestamps'
dependency      'dm-validations'
dependency      'md5'
dependency      'merb-parts'
dependency      'merb-action-args'
dependency      'merb-assets'
dependency      'merb-haml'
dependency      'merb_helpers'
dependency      'merb-mailer'
dependency      'rdiscount'
dependency      'uuid'
dependency      'lib/timestamp_extensions'

Merb::Config.use do |c|
        c[:session_secret_key]  = '1703bf9efcbb694541de2ce7c48b9406da71ac00'
        c[:session_store]       = 'datamapper'
end