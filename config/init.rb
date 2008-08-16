Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

Merb::BootLoader.before_app_loads do
        Merb::Slices::config[:merb_auth][:layout] = :application 
        
        MA[:use_activation]             = true
        MA[:forgotten_password]         = true
        MA[:from_email]                 = "nobody@waferbaby.com"
        MA[:welcome_subject]            = "Your new waferbaby.com account"
        
        Merb::Mailer.config = {:sendmail_path => '/usr/sbin/sendmail'}
        Merb::Mailer.delivery_method = :sendmail
end

Merb::BootLoader.after_app_loads do
end

Merb::Config.use do |c|
        c[:session_secret_key]  = '1703bf9efcbb694541de2ce7c48b9406da71ac00'
        c[:session_store]       = 'datamapper'
end

use_orm         :datamapper
use_test        :rspec

dependency      'dm-validations'
dependency      'dm-timestamps'
dependency      'merb-action-args'
dependency      'merb-assets'
dependency      'merb-slices'
dependency      'merb-auth'
dependency      'merb_helpers'
dependency      'rdiscount'
dependency      'lib/string_extensions'
dependency      'lib/timestamp_extensions'