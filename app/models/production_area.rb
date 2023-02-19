class ProductionArea < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
