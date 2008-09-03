#
# =>    person.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class Person
        include DataMapper::Resource
        include DataMapper::Timestamp
        include MerbAuth::Adapter::DataMapper 
        include MerbAuth::Adapter::DataMapper::DefaultModelSetup
        
        has n, :scrawls
        has n, :comments
end