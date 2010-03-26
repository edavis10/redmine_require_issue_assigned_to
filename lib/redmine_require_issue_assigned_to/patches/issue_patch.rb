module RedmineRequireIssueAssignedTo
  module Patches
    module IssuePatch

      def self.included(base)
        base.class_eval do
          unloadable
          
          validates_presence_of :assigned_to
        end
      end
    end
  end
end
