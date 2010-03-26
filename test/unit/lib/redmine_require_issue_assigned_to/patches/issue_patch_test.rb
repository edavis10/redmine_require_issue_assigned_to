require File.dirname(__FILE__) + '/../../../../test_helper'

class RedmineRequireIssueAssignedTo::Patches::IssuePatchTest < ActiveSupport::TestCase
  context "Issue" do
    subject do
      Issue.new
    end
    
    should_validate_presence_of :assigned_to
  end
end
