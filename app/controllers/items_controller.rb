class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # GET /items
  # GET /items.json
  def index
    @items = Item.with_preloaded_images.page(params[:page]).per(24)
    authorize @items
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    authorize @item
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    if params[:item][:images].present?
      @item.images.attach(params[:item][:images])
    end

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "El producto ha sido creado." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if params[:item][:images].present?
      @item.images.attach(params[:item][:images])
    end

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "El producto ha sido actualizado." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "El producto ha sido eliminado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :price, :description)
    end
end
