class ItemsController < ApplicationController
  before_action :set_list!

  def index
    @items = @list.items
  end

  def new
    @item = @list.items.new
  end

  def create
    @item = Item.new(allowed_params)

    if @item.save
      redirect_to @item, notice: 'item was successfully created.'
    else
      render :new
    end
  end

  private
    def set_list!
      @list = List.includes(:items).find_by!(id: params[:list_id])
    end 

    def allowed_params
      params.require(:item).permit(:title)
    end
end
