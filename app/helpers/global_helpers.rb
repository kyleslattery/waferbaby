#
# =>    global_helper.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

module Merb
        module GlobalHelpers
                def markup(string)
                        markdown = RDiscount.new(string)
                        
                        markdown.smart = true
                        markdown.filter_html = true
                        markdown.filter_styles = true
                        
                        markdown.to_html
                end
                
                def display_errors_for(object, error_class='errors')
                        return if object.errors.length < 1
                        
                        messages = "\n", object.errors.full_messages.collect { |message| tag('li', message) }.join("\n"), "\n"                        
                        tag('ul', messages, :class => error_class)
                end
        end
end
