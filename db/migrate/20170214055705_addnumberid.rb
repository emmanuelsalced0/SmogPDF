class Addnumberid < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :Clientnum, :float
    
  end
end
