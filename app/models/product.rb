class Product < ApplicationRecord
        has_one_attached :prodimage
        validates :name, presence: true
        validates :price, presence: true
        validates :quantity, presence: true
        validates :category, presence: true
        validates :desc, presence: true, length: { minimum: 10 }
end
