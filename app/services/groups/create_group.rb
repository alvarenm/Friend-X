class Groups::CreateGroup < BusinessProcess::Base
  needs :users
  needs :group_name
  needs :current_user

  steps :construct_array,
        :creating_group,
        :creating_user_groups

  def call
    process_steps
    @group
  end

  def construct_array
    byebug
    @users_in_group = []
    users.each do |user|
      @users_in_group.push User.find_by(email: user)
    end
  end

  def creating_group
    @group = Group.create(group_name: group_name, creator_email: current_user.email)
     return fail @group.errors unless @group.save
  end

  def creating_user_groups

    ActiveRecord::Base.transaction do
      @users_in_group.each do |user|
        UserGroup.create(user: user, group: @group)
      end
    end

    UserGroup.create(user: current_user, group: @group)
  end
  
end