class Item < ApplicationRecord
  # belongs_to :user
  # has_one :order

  validates :user,          presence: true
  validates :image,         presence: true
  validates :title,         presence: true
  validates :text,          presence: true
  validates :price,         presence: true
  validates :category_id,   presence: true
  validates :status_id,     presence: true
  validates :cost_id,       presence: true
  validates :prefecture_id, presence: true
  validates :response_id,   presence: true
end
