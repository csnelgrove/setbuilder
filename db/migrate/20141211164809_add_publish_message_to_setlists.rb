class AddPublishMessageToSetlists < ActiveRecord::Migration
  def change
    add_column :setlists, :publish_message, :string
  end
end
