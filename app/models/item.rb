class Item < ApplicationRecord
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_from_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
  validates :item_name, presence: true
  validates :price, numericality: { greater_than: 0 }
  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :shipping_from
  belongs_to :shipping_date
end
