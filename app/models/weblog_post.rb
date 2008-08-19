#
# =>    weblog_post.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class WeblogPost < Post
        
        validates_present       :title
        validates_is_unique     :slug
        
        before :save do
                if new_record?
                        self.slug = Iconv.iconv('ascii//translit//IGNORE', 'utf-8', self.title).to_s
                        
                        self.slug.gsub!(/\W+/, ' ')
                        self.slug.strip!
                        self.slug.downcase!
                        self.slug.gsub!(/\s+/, '-')
                end
        end        
end