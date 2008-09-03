class Scrawl
        include DataMapper::Resource
        include DataMapper::Timestamp
        
        property :id,           Integer, :serial => true
        property :contents,     Text
        property :created_at,   DateTime
        property :updated_at,   DateTime
        
        belongs_to :person
        
        validates_present       :contents
end
