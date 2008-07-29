#
# =>    global_helper.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

module Merb
        module GlobalHelpers
                def markup(string)
                        BlueCloth::new(string).to_html
                end
        end
end
