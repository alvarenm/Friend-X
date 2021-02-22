class ModalController < ApplicationController
  before_action :authenticate_user!, except: [:show_register]
  def show_register
  end

  def show_main
    render 'modal/main'
  end
end
