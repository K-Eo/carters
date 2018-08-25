class PagesController < ApplicationController
  def welcome
    @sliders = Slider.with_attached_image.actives.last(8)
    @items = Item.with_attached_cover.last(4)
  end

  def contact
  end

  def services
  end
end
