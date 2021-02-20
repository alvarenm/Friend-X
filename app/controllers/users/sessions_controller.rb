class Users::SessionsController < Devise::SessionsController
  def new
  end

  def create
    user = User.find_for_authentication(email: user_params[:email])
    
    if user.present? && user.valid_password?(user_params[:password])
    sign_in user, store: true
    redirect_to show_main_modal_path, success: 'boa'
    else
      redirect_to root_path, warning: 'algo errado nao está certo'
    end
  end

  def destroy
    sign_out @user
    redirect_to root_path
  end


  private

  def user_params
    params.permit(:email, :password)
  end
end
