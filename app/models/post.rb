class Post < ActiveRecord::Base
belongs_to :user

  validates :Name, presence: true, length: {minimum: 5}
  validates :Phone, presence: true, length: {minimum: 10, maximum: 15}
  validates :user_id, presence: true



  

end