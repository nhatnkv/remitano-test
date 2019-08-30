class HomeController < ApplicationController
  before_action :user_existed, only: :login_or_register
  include Devise::Controllers::Helpers
  
  def index
  end

  def login_or_register
    byebug
    if @auth_action
    else
      
    end
  end

  private

  def user_existed
    redirect_to root_path if params[:username].blank?
    @auth_action = User.find_by(username: params[:username]).present?
  end
end
