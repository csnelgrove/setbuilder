class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.boolean :published
      t.string :user_id
      t.date :service_date

      t.timestamps
    end
  end
end
