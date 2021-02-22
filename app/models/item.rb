class Item < ApplicationRecord

  belongs_to :user
  # has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :price
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :response_id
  end
end
