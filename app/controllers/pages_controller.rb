class PagesController < ApplicationController
  layout "landing"

  def welcome
    @sliders = Slider.actives.all
    @items = Item.with_preloaded_images.last(4)
  end
end
