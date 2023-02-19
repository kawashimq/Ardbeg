class ProductionArea < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :area_image
end
