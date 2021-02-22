class Users::RegistrationsController < Devise::RegistrationsController
  before_action :registration_params, only: [:create]
  
  def new
    @registration = User.new
  end

  def create
    user = User.new(registration_params)
    user.save
    if user.errors.present?
      redirect_to show_register_modal_path,  warning: 'Erro nas credenciais, por favor verifique'
    else
      sign_in user
      redirect_to show_main_modal_path
    end 
  end

  private

  def registration_params
    params.permit(:name, :email, :password)
  end
end
