class AddEmailToUser < ActiveRecord::Migration[5.0]
  def change
    add_column(:posts, :email, :string)
    add_column(:posts, :timesince, :string)
  end
end
