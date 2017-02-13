class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :Name
      t.string :Phone
      t.string :Adress  
      t.string :Veh_Year
      t.string :Make
      t.string :Model
      t.string :LicPlate
      t.string :Miles
      t.string :VIN

      t.boolean :Visa
      t.boolean :MasterCard
      t.boolean :Discover
      t.boolean :Cash

      t.boolean :Pair
      t.boolean :Air
      t.boolean :Acl
      t.boolean :Tc_cac
      t.boolean :Efe
      t.boolean :Egr
      t.boolean :Can
      t.boolean :Cat
      t.boolean :Mil
      t.boolean :O2s
      t.boolean :Pcv
      t.boolean :Timing


      t.string :CASmog
      t.string :CAInsp
      t.string :VIN2
      t.string :CASmogCert
      t.string :PreInsp
      t.string :ReInsp
      t.string :EngCover
      t.string :Other
      t.string :Evap
      t.string :Est
      t.string :GasCap
      t.string :Mis
      t.string :Tax
    end
  end
end
