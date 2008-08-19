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
        property :created_at,   DateTime
        property :updated_at,   DateTime
        
        has n,                  :posts, :through => Resource, :order => [:created_at.desc]
        
        validates_present       :name
        validates_is_unique     :slug
end
