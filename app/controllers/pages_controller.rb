class PagesController < ApplicationController
  def welcome
    @sliders = Slider.with_attached_image.actives.last(8)
    @items = Item.includes(:category)
                 .with_attached_cover
                 .order(with_discount: :desc)
                 .order(updated_at: :desc)
                 .order(created_at: :desc)
                 .take(24)
  end

  def contact
  end

  def services
  end
end
