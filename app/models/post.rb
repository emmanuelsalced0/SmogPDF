class Post < ActiveRecord::Base
belongs_to :user

  validates :Name, presence: true, length: {minimum: 5}
  validates :Phone, presence: true, length: {minimum: 10, maximum: 15}
  validates :user_id, presence: true

  
def self.search(search)
  if search
    where(['name LIKE ?', "%#{search}%"])
    where(['veh_year LIKE ?', "%#{search}%"])
    where(['make LIKE ?', "%#{search}%"])
    where(['model LIKE ?', "%#{search}%"])
    where(['vin LIKE ?', "%#{search}%"])
    where(['licplate LIKE ?', "%#{search}%"])
  else
    all  
  end
end

  

end