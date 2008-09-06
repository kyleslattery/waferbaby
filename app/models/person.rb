#
# =>    person.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class Person
        include DataMapper::Resource
        include DataMapper::Timestamp
        include MerbAuth::Adapter::DataMapper 
        include MerbAuth::Adapter::DataMapper::DefaultModelSetup
        
        property :uuid,         String, :length => 36
        
        has n, :comments
        has n, :posts
        has n, :scrawls
        
        before :save do
                self.uuid = UUID.generate
        end
end