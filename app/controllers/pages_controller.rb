class PagesController < ApplicationController
  layout "landing"

  def welcome
    @sliders = Slider.actives.all
    @items = Item.last(4)
  end
end
