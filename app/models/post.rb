class Post < ActiveRecord::Base
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