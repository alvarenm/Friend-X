class Groups::ShowGroupInfo < BusinessProcess::Base
  needs :group

  steps :fetch_users_in_group,
        :find_users_information

  def call
    process_steps
    @user_fetched
  end

  def fetch_users_in_group
    user_groups = UserGroup.find_all_by(group: group)
    @user_fetched = []
    user_groups.each do |user_group|
     user_fetch = User.find_by(user: user_group.user)
     @user_fetched.push user_fetch if user_fetch.present?
    end
  end
end