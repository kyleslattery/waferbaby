class Posts < Application
        provides :xml

        def index
                @posts = Post.all
                display @posts
        end
        
        def index_by_date(year, month = nil, day = nil)
        end
        
        def show
                @post = Post.get()
                raise NotFound unless @post
                display @post
        end

        def show_by_slug(slug)
                @post = Post.first(:slug => slug)
                raise NotFound unless @post
                
                render :show
        end        

        def new
                only_provides :html
                @post = Post.new
                render
        end

        def edit
                only_provides :html
                @post = Post.get()
                raise NotFound unless @post
                render
        end

        def create
                @post = Post.new(params[:post])
                if @post.save
                        redirect url(:post, @post)
                else
                        render :new
                end
        end

        def update
                @post = Post.get()
                raise NotFound unless @post
                @post.attributes = params[:post]
                if  @post.save
                        redirect url(:post, @post)
                else
                        raise BadRequest
                end
        end

        def destroy
                @post = Post.get()
                raise NotFound unless @post
                if @post.destroy
                        redirect url(:post)
                else
                        raise BadRequest
                end
        end

end
