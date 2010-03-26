require 'redmine'

require 'dispatcher'
Dispatcher.to_prepare :redmine_require_issue_assigned_to do
  require_dependency 'issue'
  Issue.send(:include, RedmineRequireIssueAssignedTo::Patches::IssuePatch)
end

Redmine::Plugin.register :redmine_require_issue_assigned_to do
  name 'Require Issue Assigned To'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author 'Eric Davis of Little Stream Software'
  author_url 'http://www.littlestreamsoftware.com'
  
  description 'Require Issue Assigned To is a plugin to require setting the assigned to field on issues.'
  version '0.1.0'
  requires_redmine :version_or_higher => '0.8.0'
end
