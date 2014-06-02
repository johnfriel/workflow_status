require "workflow_status/version"

module WorkflowStatus
  def workflow_statuses
    [:unpublished, :published, :trashed]
  end
end
