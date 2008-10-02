#
# =>    note.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class Note
        include DataMapper::Resource
        include DataMapper::Timestamp
        
        property :id,           Integer, :serial => true
        property :uuid,         String, :length => 36
        property :contents,     Text, :lazy => false
        property :created_at,   DateTime
        property :updated_at,   DateTime
        
        has n,                  :categories, :through => Resource
end
