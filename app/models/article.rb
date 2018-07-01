class Article < ActiveRecord::Base
  
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5, maximum: 25}
  validates :description, presence: true, length: {minimum:10, maximum: 200}
  validates :user, presence: true
  
end