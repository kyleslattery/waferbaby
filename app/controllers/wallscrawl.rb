class Wallscrawl < Application

        before :login_required, :only => [:new, :edit, :delete, :create, :update, :destroy]
        
        def index
                @scrawls = Scrawl.all(:order => [:created_at.desc])
                display @scrawls
        end
        
        def show
                @scrawl = Scrawl.get(params[:id])
                raise NotFound unless @scrawl
                display @scrawl
        end
        
        def new
                only_provides :html
                @scrawl = Scrawl.new
                render
        end

        def edit
                only_provides :html
                @scrawl = Scrawl.get(params[:id])
                raise NotFound unless @scrawl
                render
        end
        
        def delete
                only_provides :html
                @scrawl = Scrawl.get(params[:id])
                raise NotFound unless @scrawl
                render
        end

        def create
                @scrawl = Scrawl.new(params[:scrawl])
                @scrawl.person = current_person
                if @scrawl.save
                        redirect url(:wallscrawl)
                else
                        render :new
                end
        end

        def update
                @scrawl = Scrawl.get(params[:id])
                
                raise NotFound unless @scrawl
                raise BadRequest unless @scrawl.person == current_person
                
                @scrawl.attributes = params[:scrawl]
                if @scrawl.save
                        redirect url(:scrawl, @scrawl)
                else
                        raise BadRequest
                end
        end

        def destroy
                @scrawl = Scrawl.get(params[:id])
                
                raise NotFound unless @scrawl
                raise BadRequest unless @scrawl.person == current_person
                
                if @scrawl.destroy
                        redirect url(:scrawl)
                else
                        raise BadRequest
                end
        end
end
