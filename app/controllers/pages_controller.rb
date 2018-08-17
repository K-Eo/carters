class PagesController < ApplicationController
  layout "landing"

  def welcome
    @sliders = Slider.with_preloaded_image.actives.last(8)
    @items = Item.with_preloaded_images.last(4)
  end
end
