class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user 
      @micropost = current_user.microposts.build
    end
  end
end
