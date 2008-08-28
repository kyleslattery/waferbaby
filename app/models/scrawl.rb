class Scrawl
        include DataMapper::Resource

        property :id,           Integer, :serial => true
        property :contents,     Text, :lazy => false
        property :created_at,   DateTime
        property :updated_at,   DateTime
        
        belongs_to :person
        
        validates_present       :contents
end
