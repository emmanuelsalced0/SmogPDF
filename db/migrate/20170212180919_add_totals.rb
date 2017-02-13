class AddTotals < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :TotalWtax, :float
    add_column :posts, :Total, :float
  end
end
