class NotePart < Merb::PartController

        def index
                @notes = Note.all
                
                display @notes
        end

end
