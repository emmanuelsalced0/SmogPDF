class AddVinLicScanPost < ActiveRecord::Migration[5.0]
  def change
    add_column(:posts, :scan, :string)
  end
end
