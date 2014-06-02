require "workflow_status/version"
require "workflow_status/instance_methods"

module WorkflowStatus
  WORKFLOW_STATUS_MAP = {
    unpublished:  0,
    published:    1,
    trashed:      2
  }
  
  class << self
    def extended(extender)
      extender.send :include, InstanceMethods
    end
  end
  
  def workflow_statuses
    workflow_status_map.keys
  end

  def unpublished
    where(workflow_status: workflow_status_code(:unpublished))
  end
  
  def published
    where(workflow_status: workflow_status_code(:published))
  end
  
  def trashed
    where(workflow_status: workflow_status_code(:trashed))
  end


  # for Rails form select helper
  def status_options_for_select
    workflow_status_map.to_a
  end

  private

  def workflow_status_code(text_value)
    workflow_status_map.fetch text_value.to_sym
  end

  def workflow_status_map
    WORKFLOW_STATUS_MAP
  end
end
