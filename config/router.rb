Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
        
        r.default_routes
        r.match('/').to(:controller => 'posts', :action => 'index')
        
end