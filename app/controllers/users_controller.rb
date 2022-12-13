class UsersController < ApplicationController
  before_action :set_user, only: %i[ destroy ]

  def index
    @pagy, @users = pagy(User.all.order(name: :asc), items: 10)
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
