class Scrawl
        include DataMapper::Resource
        include DataMapper::Timestamp
        
        property :id,           Integer, :serial => true
        property :uuid,         String, :length => 36
        property :contents,     Text
        property :created_at,   DateTime
        property :updated_at,   DateTime
        
        belongs_to :person
        
        validates_present       :contents
        
        before :save do
                self.uuid = UUID.generate
        end
end
