namespace :require_issue_assigned_to do
  desc <<-END_DESC
Update all of the issues with blank or empty assigned_to using USER

Examples:
  rake require_issue_assigned_to:update_blank_assignees USER=user # user login
  rake require_issue_assigned_to:update_blank_assignees USER=100  # record number

END_DESC
  task :update_blank_assignees => :environment do
    user_param = ENV['USER'] || ENV['user']
    user = User.find_by_login(user_param)
    user ||= User.find_by_id(user_param)
    
    raise ArgumentError, "USER must be set to a valid user login or record number" if user.blank?
    
    Issue.update_all("assigned_to_id = '#{user.id}'", ["assigned_to_id IS NULL OR assigned_to_id = ''"])
  end
end
