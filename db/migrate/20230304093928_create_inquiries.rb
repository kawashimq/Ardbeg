class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.string :email, null:false, default: ""
      t.text :content_inquiry, null:false
      t.timestamps
    end
  end
end
