class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null:false
      t.integer :production_area_id, null:false
      t.text :content, null:false
      t.string :item, null:false
    
      t.timestamps
      
    end
  end
end
