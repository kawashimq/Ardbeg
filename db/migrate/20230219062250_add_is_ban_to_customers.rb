class AddIsBanToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_ban, :boolean, default: false
  end
end
