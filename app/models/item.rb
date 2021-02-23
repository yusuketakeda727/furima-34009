class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :response
  belongs_to :user
  # has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :cost_id
    validates :prefecture_id
    validates :response_id
    validates :status_id
  end
end
