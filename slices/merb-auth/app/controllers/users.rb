class MerbAuth::Users < MerbAuth::Application

        def index
                @people = MA[:user].all(:order => [:created_at.desc])
                display @people
        end
        
        def show
                @person = MA[:user].first(:login => params[:login])
                raise NotFound unless @person
                display @person
        end
        
end