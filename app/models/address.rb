class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    post_cord
    city
    address
    phone_number
  end
  validates :prefecture_id, numericality: { other_than: 1 }
end
