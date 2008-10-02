class NotePart < Merb::PartController

        def show_latest
                @note = Note.all.reverse.first
                render :show
        end

end
