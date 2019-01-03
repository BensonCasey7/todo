class ItemsController < ApplicationController
  before_action :set_list!
  before_action :auth_check

  def index
    @items = @list.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = @list.items.new
  end

  def create
    @item = Item.new(allowed_params)
    @item.list_id = @list.id
    if @item.save
      redirect_to list_items_path(@list), notice: 'Item was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(allowed_params)
      redirect_to list_items_path(@list), notice: 'Item was successfully updated.'
    else
      render 'new'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to list_items_path(@list)
  end

  private
    def set_list!
      @list = List.includes(:items).find_by!(id: params[:list_id])
    end 

    def allowed_params
      params.require(:item).permit(:content)
    end

    def auth_check
      puts current_user.is_list_owner(@list)
      redirect_to root_path if not current_user.is_list_owner(@list)
    end
end
