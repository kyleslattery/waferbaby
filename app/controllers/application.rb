class Application < Merb::Controller

        protected                      
                def logged_in?
                        current_person != :false
                end
                
                def current_person
                        @current_person ||= (login_from_session || :false)
                end

                def current_person=(person)
                        session[:person] = person.nil? ? nil : person.id
                        @current_user = person
                end
                
                def login_from_session
                        self.current_person = Person.get(session[:person]) if session[:person]
                end
                
                def login_required
                        authorized? || throw(:halt, :access_denied)
                end
                
                def authorized?
                        logged_in?
                end
                
                def access_denied
                        session[:return_to] = request.uri
                        redirect url(:login)
                end
                
end