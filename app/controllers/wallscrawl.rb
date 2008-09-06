class Wallscrawl < Application

        before :login_required, :only => [:new, :edit, :delete, :create, :update, :destroy]
        provides :atom, :text, :xml
        
        def index
                @scrawls = Scrawl.all(:order => [:created_at.desc])
                display @scrawls
        end
        
        def index_by_date(created_year, created_month = nil, created_day = nil)
                created_month = '__' if created_month == nil
                created_day   = '__' if created_day   == nil
                
                date            = "#{created_year}-#{created_month}-#{created_day}%"
                @scrawls        = Scrawl.all(:created_at.like => date, :order => [:created_at.desc])
                
                display @scrawls, :index
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
                
                if @scrawl.update_attributes(params[:scrawl]) || !@scrawl.dirty?
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
