module WorkflowStatus::InstanceMethods
  def workflow_status
  end
  
  def workflow_status=
  end

  def published?
    workflow_status == :published
  end
  
  def unpublished?
    workflow_status == :unpublished
  end
  
  def trashed?
    workflow_status == :trashed
  end
end
