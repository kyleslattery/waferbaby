require 'slugger'

class Category
        include DataMapper::Resource
        include DataMapper::Timestamp
        include Waferbaby::Slug
        
        property :id,           Integer, :serial => true
        property :slug,         String
        property :name,         String
        property :created_on,   DateTime
        property :updated_on,   DateTime
        
        validates_present       :name
        validates_is_unique     :slug

        before :save do 
                self.slug = self.slug_for(:name) if new_record?
        end        
end
