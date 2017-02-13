class BooleanToString < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :Visa, :string
    change_column :posts, :MasterCard, :string
    change_column :posts, :Discover, :string
    change_column :posts, :Cash, :string
    change_column :posts, :Pair, :string
    change_column :posts, :Air, :string
    change_column :posts, :Acl, :string
    change_column :posts, :Tc_cac, :string
    change_column :posts, :Efe, :string
    change_column :posts, :Egr, :string
    change_column :posts, :Can, :string
    change_column :posts, :Cat, :string
    change_column :posts, :Mil, :string
    change_column :posts, :O2s, :string
    change_column :posts, :Pcv, :string
    change_column :posts, :Timing, :string
  end
end

