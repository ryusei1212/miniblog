class Users::Posts::ApplicationController < Users::ActionController::Base
  before_action :set_post

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
