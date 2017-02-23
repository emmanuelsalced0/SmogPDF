class ChangePrices < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:posts, :CASmogCert, 8.25)
    change_column_default(:posts, :Tax, 0)
  end
end
