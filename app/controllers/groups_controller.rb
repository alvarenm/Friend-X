class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :separate_emails, only: [:create]
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find_by(id: show_params[:id])
  end

  def create
    group = Groups::CreateGroup.call(users: @emails, group_name: create_params[:group_name], current_user: current_user)

    return redirect_to groups_path(current_user.id), method: :get, warning: 'Houve um erro, tente novamente' unless group.success?

    redirect_to groups_path(current_user.id), method: :get, success: 'Grupo foi criado com sucesso! Pode começar a sortear'
  end

  # def show_group_info
  #   @group_selected = Groups.find_by(id: show_info_params[:id])
  #   rendirect_to groups_path(current_user.id), method: :get, warning: 'Grupo Inválido.' unless @group_selected.present?

  #   group_info = Groups::ShowGroupInfo.call(group = group_selected)
  # end

  private

  def show_info_params
    params.permit(:id)
  end


  def show_params
    params.permit(:id)
  end

  def create_params
    params.permit(:group_name, :user_emails)
  end


  def separate_emails
    @emails = create_params[:user_emails].split(',')
  end
end

