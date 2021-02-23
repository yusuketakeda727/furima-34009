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

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than: 10000000 }
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :cost_id
    validates :prefecture_id
    validates :response_id
    validates :status_id
  end
end
