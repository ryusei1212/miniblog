class Users::UsersController < Users::ApplicationController
  before_action :set_user, only: %i[show following followers]

  def index
    @users = User.default_order.with_attached_avater.includes(:avater_attachment).page(params[:page])
  end

  def show
    @posts = @user.posts.with_attached_image.default_order
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
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
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile, :avater)
  end
end
