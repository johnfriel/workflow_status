module WorkflowStatus::InstanceMethods
  def workflow_status
  end
  
  def workflow_status=
  end

  def published?
    workflow_status == :published
  end
end
