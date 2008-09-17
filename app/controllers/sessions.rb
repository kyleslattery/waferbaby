class Sessions < Application

        def new
                if request.post?
                        self.current_person = Person.authenticate(params[:username], params[:password])
                        if logged_in?
                                url = session[:return_to] || "/"
                                session[:return_to] = nil
                                redirect(url)
                        end
                end
                
                render
        end

        def destroy
                session.clear!
                redirect("/") 
        end

end