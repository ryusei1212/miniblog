class Users::UsersController < Users::ApplicationController
  before_action :set_user, only: %i[edit update following followers]

  def index
    @users = User.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
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
