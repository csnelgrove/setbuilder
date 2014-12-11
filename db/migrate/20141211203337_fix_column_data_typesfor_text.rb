class FixColumnDataTypesforText < ActiveRecord::Migration
 def change
    change_column :setlists, :publish_message, :text
    change_column :posts, :message, :text
  end


end
