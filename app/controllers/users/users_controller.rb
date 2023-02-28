class Users::UsersController < Users::ApplicationController
  before_action :set_user, only: %i[edit update]

  def index
    @users = User.default_order.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.default_order
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def following
  end

  def followers
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :profile)
  end
end
