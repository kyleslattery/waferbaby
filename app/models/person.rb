#
# =>    person.rb
# =>    Copyright (c) 2008 Daniel Bogan. http://waferbaby.com/
#

require 'bcrypt'

class Person
        include DataMapper::Resource
        include DataMapper::Timestamp
        include BCrypt

        property :id, Integer, :serial => true
        property :uuid, String, :length => 36
        property :old_crypted_password, String
        property :salt, String
        property :crypted_password, String
        property :username, String, :length => 2..40
        property :email_address, String, :format => :email_address
        property :created_at, DateTime
        property :updated_at, DateTime

        validates_is_unique :username, :email_address
        validates_length :password, :in => 4..40, :if => :password_required?
        validates_is_confirmed :password, :groups => :create, :if => :password_required?
        validates_format :username, :as => /^([a-zA-Z0-9_])$/, :message => "Username can only contain letters, numbers or an underscore."
        
        has n, :comments
        has n, :posts
        has n, :scrawls
        
        attr_accessor :password, :password_confirmation
        
        before :save, :assign_uuid
        before :save, :encrypt_password
        
        def authenticated?(clear_password)
                # start migration code
                if self.old_crypted_password
                        require 'digest/sha1'
                        
                        if self.old_crypted_password != Digest::SHA1.hexdigest("--#{self.salt}--#{clear_password}--")
                                return false
                        end
                        
                        self.password = clear_password
                        self.old_crypted_password = nil
                        
                        self.encrypt_password
                        self.save!
                end
                # end migration code

                Password.new(crypted_password) == clear_password
        end
        
        protected
                def self.authenticate(username, clear_password)
                        person = first(:username => username)
                        person && person.authenticated?(clear_password) ? person : nil
                end

                def password_required?
                        self.crypted_password.blank? || !self.password.blank?
                end
                
                def encrypt_password
                        self.crypted_password = Password.create(self.password) unless self.password.blank?
                end
                
                def assign_uuid
                        self.uuid = UUID.generate
                end

end