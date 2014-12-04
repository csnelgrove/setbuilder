class AddVerifiedToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :verified, :boolean
  end
end
