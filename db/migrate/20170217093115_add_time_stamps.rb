class AddTimeStamps < ActiveRecord::Migration[5.0]
  def change
     add_column(:posts, :created_at, :datetime)
     change_column_default(:posts, :Tax, 0.0975)
  end
end
