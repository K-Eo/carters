class SlidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_slider, only: [:show, :edit, :update, :destroy, :toggle_state]


  # GET /sliders
  # GET /sliders.json
  def index
    @sliders = Slider.with_attached_image
                     .order_by_active
                     .order_by_newest
                     .page(params[:page])
  end

  # GET /sliders/1
  # GET /sliders/1.json
  def show
  end

  # GET /sliders/new
  def new
    @slider = Slider.new
  end

  # GET /sliders/1/edit
  def edit
  end

  # POST /sliders
  # POST /sliders.json
  def create
    @slider = Slider.new(slider_params)

    if params[:slider][:image].present?
      @slider.image.attach(params[:slider][:image])
    end

    respond_to do |format|
      if @slider.save
        format.html { redirect_to @slider, notice: "El slider ha sido creado." }
        format.json { render :show, status: :created, location: @slider }
      else
        format.html { render :new }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sliders/1
  # PATCH/PUT /sliders/1.json
  def update
    if params[:slider][:image].present?
      @slider.image.attach(params[:slider][:image])
    end

    respond_to do |format|
      if @slider.update(slider_params)
        format.html { redirect_to @slider, notice: "El slider ha sido actualizado." }
        format.json { render :show, status: :ok, location: @slider }
      else
        format.html { render :edit }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sliders/1
  # DELETE /sliders/1.json
  def destroy
    @slider.destroy
    respond_to do |format|
      format.html { redirect_to sliders_url, notice: "El slider ha sido eliminado." }
      format.json { head :no_content }
    end
  end

  def toggle_state
    @slider.toggle!(:active)
    respond_to do |format|
      format.html { redirect_to sliders_url, notice: "El estado del slider ha sido actualizado." }
      format.json { render :show, status: :ok, location: @slider }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider
      @slider = Slider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_params
      params.require(:slider).permit(:active)
    end
end
