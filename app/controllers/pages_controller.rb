class PagesController < ApplicationController
  def welcome
    @sliders = Slider.actives.all
  end
end
