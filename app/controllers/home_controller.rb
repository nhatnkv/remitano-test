class HomeController < ApplicationController
  before_action :user_existed, only: :login_or_register
  include Devise::Controllers::Helpers
  
  def index
    @movies = Movie.all
  end

  def login_or_register
    if user_existed
      if user.valid_password?(params[:password])
        sign_in(user)
      else
        flash[:error] = "error"
      end
    else
      new_user = User.create(username: params[:username], password: params[:password])
      sign_in(user)
    end
    redirect_to root_path
  end

  private

  def user_existed
    redirect_to root_path if params[:username].blank? || params[:password].blank?
    @auth_action = user.present?
  end

  def user
    User.find_by(username: params[:username])
  end
end
