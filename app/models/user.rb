class User <ActiveRecord::Base
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    before_save {self.email = email.downcase}
    
    has_many :articles
    
    has_secure_password
    
    validates :username, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: {minimum:4, maximum:15}
    validates :email, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}
end
