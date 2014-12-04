class CreateMinistries < ActiveRecord::Migration
  def change
    create_table :ministries do |t|
      t.string :name
      t.string :description
      t.boolean :children
      t.boolean :worship

      t.timestamps
    end
  end
end
