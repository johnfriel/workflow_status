require "workflow_status/version"
require "workflow_status/instance_methods"

module WorkflowStatus
  
  class << self
    def extended(extender)
      extender.send :include, InstanceMethods
    end
  end
  
  def workflow_statuses
    [:unpublished, :published, :trashed]
  end

  def unpublished
    where(workflow_status: 0)
  end
  
  def published
    where(workflow_status: 1)
  end
  
  def trashed
    where(workflow_status: 2)
  end


  # for Rails form select helper
  def status_options_for_select
    [
      [:unpublished, 0],
      [:published,   1],
      [:trashed,     2],
    ]
  end
end
