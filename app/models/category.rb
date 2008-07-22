class Category
        include DataMapper::Resource
        include DataMapper::Timestamp
        
        property :id,           Integer, :serial => true
        property :slug,         String
        property :name,         String
        property :created_on,   DateTime
        property :updated_on,   DateTime
        
        validates_present       :name
        validates_is_unique     :slug
end
