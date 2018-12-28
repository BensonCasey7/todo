class ListsController < ApplicationController
  def index
    @user = current_user
    @lists = @user.lists.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(allowed_params)
    @list.user = current_user
    if @list.save
      redirect_to lists_path
    else
      render 'new'
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(allowed_params)
      redirect_to lists_path
    else
      render 'new'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private
    def allowed_params
      params.require(:list).permit(:name)
    end
end
