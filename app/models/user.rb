class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英数字混在にしてください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
    validates :last_name_kana,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
    validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
    validates :password, format: { without: /[^\x00-\x7F]/, message: 'は全角文字を含めることはできません' }
  end
    has_many :items
    has_many :orders
end
