class PlaysController < ApplicationController
  before_action :authenticate_user!
  before_action :play_params

  def create 
    @group = Group.find_by(id: play_params[:id])
    play = Plays::CreatePlay.call(group: @group)
    puts play
    redirect_to groups_path(current_user.id), method: :get, warning: 'Houve um erro, tente novamente' unless play.success?
  end

  private

  def play_params
    params.permit(:id)
  end

  def sort_params
    params.permit(:play_id)
  end

end