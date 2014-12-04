class ChangeSingleAccessTokenInUsers < ActiveRecord::Migration
  def up
    change_column :users, :single_access_token,  :string, :null => true
    
  end

  def down
  end
end
