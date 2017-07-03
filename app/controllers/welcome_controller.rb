class WelcomeController < ApplicationController
  def index
    flash[:notice] = "棒棒哒！"
  end
end
