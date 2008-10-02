class People < Application
        # provides :xml, :yaml, :js

        def index
                @people = Person.all(:order => [:created_at.desc])
                display @people
        end

        def show
                @person = Person.first(:username => params[:username])
                raise NotFound unless @person
                display @person
        end

        def new
                only_provides :html
                @person = Person.new
                
                render
        end

        def edit
                only_provides :html
                @person = Person.first(:username => params[:username])
                raise NotFound unless this_is_me(@person)

                render
        end

        def create
                @person = Person.new(params[:person])
                if @person.save
                        redirect url(:person, @person)
                else
                        render :new
                end
        end

        def update
                @person = Person.get(params[:username])
                raise NotFound unless this_is_me(@person)
                if @person.update_attributes(params[:person]) || !@person.dirty?
                        redirect url(:person, @person)
                else
                        raise BadRequest
                end
        end

        def destroy
                @person = Person.get(params[:username])
                raise NotFound unless this_is_me(@person)
                if @person.destroy
                        redirect url(:person)
                else
                        raise BadRequest
                end
        end
        
        def this_is_me(person)
                person && person == current_person
        end

end