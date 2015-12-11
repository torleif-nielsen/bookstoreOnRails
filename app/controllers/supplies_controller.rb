class SuppliesController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.where("category = 'School Supplies'")
  end
end
