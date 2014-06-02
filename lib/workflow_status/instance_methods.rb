module WorkflowStatus::InstanceMethods
  
  def workflow_status
    code = read_attribute :workflow_status
    [:unpublished, :published, :trashed][code]
  end
  
  def workflow_status=(status_symbol)
    options = {
      unpublished: 0,
      published:   1,
      trashed:     2
    }
    value = options.fetch(status_symbol)
    write_attribute :workflow_status, value
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
