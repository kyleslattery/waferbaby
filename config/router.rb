Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
        r.add_slice(:MerbAuth, :path => '', :default_routes => false)

        r.match('/about').to(:controller => 'help', :action => 'show_about').name(:about)
  
        r.match('/posts/categories/:category').to(:controller => 'posts', :action => 'index_by_category').name(:post_category)

        r.match(%r'/([a-z]+)/([0-9]{4,})/([0-9]{2,})/([0-9]{2,})').to(:controller => '[1]', :action => 'index_by_date', :created_year => '[2]', :created_month => '[3]', :created_day => '[4]').name(:scrawls_by_day)
        r.match(%r'/([a-z]+)/([0-9]{4,})/([0-9]{2,})').to(:controller => '[1]', :action => 'index_by_date', :created_year => '[2]', :created_month => '[3]').name(:scrawls_by_month)
        r.match(%r'/([a-z]+)/([0-9]{4,})').to(:controller => '[1]', :action => 'index_by_date', :created_year => '[2]').name(:scrawls_by_year)
        
        r.resources(:posts, :keys => ['created_year', 'created_month', 'created_day', 'slug']) do |posts|
                posts.resources(:comments)
        end

        r.resources(:wallscrawl)
        
        r.match('/').to(:controller => 'posts', :action => 'index').name(:posts)
end