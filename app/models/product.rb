class Product < ActiveRecord::Base
  validates :title, :description, :price, :category, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'extension must be gif, jpg, or png for the image'
  }

  has_many :cart_items
  #before_destroy :ensure_not_referenced_by_any_cart_item

  private

  def ensure_not_referenced_by_any_cart_item
    if cart_items.empty?
      return true
    else
      errors.add(:base, 'There are items in this cart')
      return false
    end
  end
end
