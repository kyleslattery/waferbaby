#
# =>    note.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class Note
        include DataMapper::Resource
        include DataMapper::Timestamp

        property :id,           Integer, :serial => true
        property :contents,     Text
        property :created_on,   DateTime
        property :updated_on,   DateTime

        has n,                  :categories, :through => Resource
        
        validates_present       :contents
end
