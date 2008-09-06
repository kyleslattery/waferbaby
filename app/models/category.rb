#
# =>    category.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class Category
        include DataMapper::Resource
        include DataMapper::Timestamp
        
        property :id,           Integer, :serial => true
        property :uuid,         String, :length => 36
        property :slug,         String
        property :name,         String
        property :created_at,   DateTime
        property :updated_at,   DateTime
        
        has n,                  :posts, :through => Resource, :order => [:created_at.desc]
        
        validates_present       :name
        validates_is_unique     :slug
        
        before :save do
                self.uuid = UUID.generate
        end
end
