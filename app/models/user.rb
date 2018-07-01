class User <ActiveRecord::Base
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :username, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: {minimum:4, maximum:15}
    validates :email, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}
end
