require 'iconv'

module Slug
        def set_slug
                slug = self.klass.slug_for(self.title) if new_record?
        end
        
        def self.slug_for(title)
                title = Iconv.iconv('ascii//translit//IGNORE', 'utf-8', title).to_s
                
                title.gsub!(/\W+/, ' ')
                title.strip!
                title.downcase!
                title.gsub!(/\s+/, '-')
                
                title
        end
end