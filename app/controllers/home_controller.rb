class HomeController < ApplicationController
  def index
    redirect_to show_main_modal_path if user_signed_in?
  end
end