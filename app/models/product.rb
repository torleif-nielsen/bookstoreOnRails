class Product < ActiveRecord::Base
  validates :title, :description, :price, :category, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'extension must be gif, jpg, or png for the image'
  }
end
