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
      # 画像が何も投稿されていない場合は彼岸花の写真が表示される
      file_path = Rails.root.join('app/assets/images/DSC_0581.JPG')
      image.attach(io: File.open(file_path), filename: 'DSC_0581.JPG')
    end
    image
  end
  
  def self.ransackable_attributes(auth_object = nil)
    %w[content]
  end
end
