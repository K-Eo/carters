class PagesController < ApplicationController
  def welcome
    @sliders = Slider.with_attached_image.actives.last(8)
    @items = Item.with_preloaded_images.last(4)
  end

  def contact
  end

  def services
  end
end
