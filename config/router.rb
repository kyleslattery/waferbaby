Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
        r.match('/archives/:year/:month/:day/:slug').to(:controller => 'posts', :action => 'show_by_slug')
        r.match('/').to(:controller => 'posts', :action => 'index')
end