class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  def index
    @chefs = Chef.all
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:sucess] = "welcome #{@chef.chefname} to My recipe App"
      redirect_to chef_path(@chef)
    else
      render "new"
    end
  end

  def show
    @chef_recipes = @chef.recipes.paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash[:sucess] = "Your account was updated sucessfully"
      redirect_to chef_path(@chef)
    else
      render "edit"
    end

    def destroy
      @chef.destroy
      flash[:sucess] = "Chef deleted sucessfully"
      redirect_to chefs_path
    end

  end


private
  def chef_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end
end
