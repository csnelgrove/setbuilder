class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_id
      t.string :street_1
      t.string :street_2
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :nickname

      t.timestamps
    end
  end
end
