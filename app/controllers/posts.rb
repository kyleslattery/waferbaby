#
# =>    posts.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

require 'categories_helper'

class Posts < Application
        provides :atom, :text, :xml

        def index
                @posts = Post.all(:order => [:created_at.desc], :limit => 10)
                display @posts
        end
        
        def index_by_date(created_year, created_month = nil, created_day = nil)
                created_month = '__' if created_month == nil
                created_day   = '__' if created_day   == nil
                
                date    = "#{created_year}-#{created_month}-#{created_day}%"
                @posts  = Post.all(:created_at.like => date, :order => [:created_at.desc])
                
                display @posts, :index
        end
        
        def index_by_category(category)
                @category = Category.first(:slug => category)                
                raise NotFound unless @category && @category.posts
                
                @posts = @category.posts
                
                display @posts, :index
        end
        
        def show
                @post = Post.first(:slug => params[:slug])
                raise NotFound unless @post
                
                @post.is_selected = true
                
                render :show
        end
end
