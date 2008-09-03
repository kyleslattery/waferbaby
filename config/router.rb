Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
        r.add_slice(:MerbAuth, :path => '', :default_routes => false)

        r.match('/about').to(:controller => 'help', :action => 'show_about').name(:about)
  
        r.match('/posts/categories/:category').to(:controller => 'posts', :action => 'index_by_category').name(:post_category)
        r.match('/posts/:created_year').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_year)
        r.match('/posts/:created_year/:created_month').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_month)
        r.match('/posts/:created_year/:created_month/:created_day').to(:controller => 'posts', :action => 'index_by_date').name(:posts_by_day)
        
        r.resources(:posts, :keys => ['created_year', 'created_month', 'created_day', 'slug']) do |posts|
                posts.resources(:comments)
        end
        
        r.resources(:wallscrawl)
        
        r.match('/').to(:controller => 'posts', :action => 'index').name(:posts)
end