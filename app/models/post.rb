require 'slugger'

class Post
        include DataMapper::Resource
        include DataMapper::Timestamp
        include Slug
        
        property :id,           Integer, :serial => true
        property :slug,         String
        property :title,        String
        property :contents,     Text
        property :created_on,   DateTime
        property :updated_on,   DateTime
        
        has n,                  :categories, :through => Resource
        
        validates_present       :title
        validates_present       :contents
        validates_is_unique     :slug
        
        attr_accessor           :is_selected

        before :save do
                self.slug = self.slug_for(:title) if new_record?
        end
end
