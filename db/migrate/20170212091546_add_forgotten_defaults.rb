class AddForgottenDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:posts, :CASmogCert, 0)
    change_column_default(:posts, :ReInsp, 0)
    change_column_default(:posts, :Est, 0)
    
  end
end
