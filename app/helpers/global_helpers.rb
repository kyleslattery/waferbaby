#
# =>    global_helper.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

module Merb
        module GlobalHelpers
                def markup(string)
                        RDiscount.new(string).to_html
                end
        end
end
