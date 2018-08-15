class PagesController < ApplicationController
  def welcome
    @sliders = Slider.actives.all
    @items = Item.take(4)
  end
end
