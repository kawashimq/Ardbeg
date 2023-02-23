class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :production_area
  has_many   :comments, dependent: :destroy
  has_many   :favorites, dependent: :destroy
    
    
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end  
    
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def self.ransackable_attributes(auth_object = nil)
    %w[content]
  end
end
