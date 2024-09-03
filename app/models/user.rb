class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, length: { minimum: 6 }
    validates :password, length: { minimum: 6 },
                         format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must include both letters and numbers' }
    validates :password, length: { minimum: 6 }, confirmation: true
    validates :first_name
    validates :last_name
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
    validates :last_name_kana,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
    validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
    validates :birthday
  end
end
