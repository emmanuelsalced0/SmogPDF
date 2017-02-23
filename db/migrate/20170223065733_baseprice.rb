class Baseprice < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:posts, :CASmog, 51.75)
  end
end
