#
# =>    posts.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class Posts < Application
        provides :text, :xml

        def index
                @posts = Post.all(:order => [:created_at.desc])
                display @posts
        end
        
        def index_by_date(year, month = nil, day = nil)
                month = '__' if month == nil
                day   = '__' if day   == nil
                
                date    = "#{year}-#{month}-#{day}%"
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
