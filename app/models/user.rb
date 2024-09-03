class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must contain @' }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must include both letters and numbers' }
  attr_accessor :password_confirmation

  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
  validates :birthday, presence: true
end
