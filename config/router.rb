Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
        r.add_slice(:MerbAuth, :path => '', :default_routes => false)

        r.match('/about').to(:controller => 'help', :action => 'show_about').name(:about)

        r.match('/archives/categories/:category').to(:controller => 'posts', :action => 'index_by_category').name(:post_category)
        r.match('/archives/:year').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_year)
        r.match('/archives/:year/:month').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_month)
        r.match('/archives/:year/:month/:day').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_day)
        r.resources(:archives, :controller => 'posts', :keys => ['year', 'month', 'day', 'slug'])

        r.resources(:wallscrawl)
        
        r.match('/').to(:controller => 'posts', :action => 'index').name(:posts)
end