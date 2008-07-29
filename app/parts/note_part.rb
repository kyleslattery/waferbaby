class NotePart < Merb::PartController

        def index
                @notes = Note.all(:order => [:created_on.desc])
                
                display @notes
        end

end
