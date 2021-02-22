class Plays::SortPlay < BusinessProcess::Base
  needs :play_id

  steps :find_play,
        :fetch_users
        :sort_users

  def call
    process_steps
  end

  def find_play
    @play = Play.find_by(id: play_id)
    byebug
    return fail unless @play.present?
  end

  def fetch_users
    @unsorted_users = []
    @unsorted_users = @play.users
    return fail unless @unsorted_users.present?   
  end

  def sort_users
    sorted_players = []
    i = 0
    while i < @unsorted_users.lenght do
      selected = @unsorted_users.sample
      sorted_players.push selected
    end
    puts sorted_players
  end
end