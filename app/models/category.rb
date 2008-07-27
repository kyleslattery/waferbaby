#
# =>    category.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class Category
        include DataMapper::Resource
        include DataMapper::Timestamp
        
        property :id,           Integer, :serial => true
        property :slug,         String
        property :name,         String
        property :created_on,   DateTime
        property :updated_on,   DateTime
        
        has n,                  :posts, :through => Resource
        
        validates_present       :name
        validates_is_unique     :slug
end
