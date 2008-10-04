class NotePart < Merb::PartController

        def index
                @notes = Note.all(:order => [:created_at.desc], :limit => 2)
                render
        end

end
