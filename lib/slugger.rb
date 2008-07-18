require 'iconv'

module Waferbaby
        module Slug
                def self.for(field)
                        field = Iconv.iconv('ascii//translit//IGNORE', 'utf-8', field).to_s

                        field.gsub!(/\W+/, ' ')
                        field.strip!
                        field.downcase!
                        field.gsub!(/\s+/, '-')

                        field
                end
        
                def slug_for(field_symbol)
                        Waferbaby::Slug.for(self.send(field_symbol))
                end
        end
end