class Room < ApplicationRecord
  belongs_to :customer
  belongs_to :admin
  has_many   :messages
end
