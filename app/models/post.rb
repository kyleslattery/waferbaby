require 'iconv'

class Post
        include DataMapper::Resource
        include DataMapper::Timestamp
        
        property :id,           Integer, :serial => true
        property :slug,         String
        property :title,        String
        property :contents,     Text
        property :created_on,   DateTime
        property :updated_on,   DateTime
        
        validates_present       :title
        validates_is_unique     :slug        

        before :save do 
                set_slug
        end
        
        def set_slug
                self.slug = Post.slug_for(self.title) if new_record?
        end
        
        def self.slug_for(title)
                title = Iconv.iconv('ascii//translit//IGNORE', 'utf-8', title).to_s
                
                title.gsub!(/\W+/, ' ')
                title.strip!
                title.downcase!
                title.gsub!(/\s+/, '-')
                
                return title
        end
end
