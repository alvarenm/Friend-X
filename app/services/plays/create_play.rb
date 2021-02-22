class Plays::CreatePlay < BusinessProcess::Base
  needs :group

  steps :create_play

  def call
  process_steps
  end

  def create_play

    @play = Play.create(group: group)
    return fail unless @play.save

  end
end