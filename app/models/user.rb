class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :email, uniqueness: { case_sensitive: true }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角で入力してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ]+\z/, message: 'カナで入力してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  # has_many :items
  # has_many :orders

end
