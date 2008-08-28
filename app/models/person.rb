#
# =>    person.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

class Person
        include DataMapper::Resource
        include MerbAuth::Adapter::DataMapper 
        include MerbAuth::Adapter::DataMapper::DefaultModelSetup
        
        has n, :scrawls
end