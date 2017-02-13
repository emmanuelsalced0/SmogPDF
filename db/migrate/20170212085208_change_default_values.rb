class ChangeDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:posts, :CASmog, 0)
    change_column_default(:posts, :CAInsp, 0)
    change_column_default(:posts, :VIN2, 0)
    change_column_default(:posts, :PreInsp, 0)
    change_column_default(:posts, :EngCover, 0)
    change_column_default(:posts, :Other, 0)
    change_column_default(:posts, :Evap, 0)
    change_column_default(:posts, :GasCap, 0)
    change_column_default(:posts, :Mis, 0)
    change_column_default(:posts, :Tax, 9.75)
    

  end
end
