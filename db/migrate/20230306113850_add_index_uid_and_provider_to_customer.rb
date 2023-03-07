class AddIndexUidAndProviderToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :uid, :string
    add_column :customers, :provider, :string
    add_index :customers, %i[uid provider]
  end
end
