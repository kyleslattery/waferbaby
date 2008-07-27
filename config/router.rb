Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
        r.match('/archives/categories/:category').to(:controller => 'posts', :action => 'index_by_category').name(:post_category)
        r.match('/archives/:year/:month/:day/:slug').to(:controller => 'posts', :action => 'show_by_slug').name(:post)
        r.match('/archives/:year/:month/:day').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_day)
        r.match('/archives/:year/:month').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_month)
        r.match('/archives/:year').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_year)        
        r.match('/about').to(:controller => 'help', :action => 'show_about').name(:about)
        r.match('/').to(:controller => 'posts', :action => 'index').name(:posts)
end