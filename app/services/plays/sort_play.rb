class Plays::SortPlay < BusinessProcess::Base
  needs :play_id

  steps :find_play,
        :find_group,
        :fetch_users,
        :sort_users

  def call
    process_steps
  end

  def find_play
    @play = Play.find_by(id: play_id)
    byebug
    return fail unless @play.present?
  end

  def find_group
    @group = Group.find_by(id: @play.group_id)
    byebug
  end

  def fetch_users
    @unsorted_users = []
    user_groups = @play.group.user_group
    byebug
    user_groups.each do |user_group|
    @unsorted_users.push User.find_by(id: user_group.user_id)
    end
    byebug
    reuturn fail unless @unsorted_users.present?
  end

  def sort_users
    sorted_players = []
    a = @unsorted_users.length
    i = 0
    while i < a do
      byebug
      selected = @unsorted_users.sample
      sorted_players.push selected
      a -= 1  
    end
    @play.sorted_players = sorted_players
  end
end