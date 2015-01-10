module WorkflowStatus::InstanceMethods
  
  def workflow_status
    code = read_attribute :workflow_status
    workflow_status_map.invert.fetch(code)
  end
  
  def workflow_status=(status_symbol)
    if [0, 1, 2, '0', '1', '2'].include? status_symbol
      value = status_symbol.to_i
    else
      value = workflow_status_map.fetch(status_symbol.to_sym)
    end
    
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

  private

  def workflow_status_map
    WorkflowStatus::WORKFLOW_STATUS_MAP
  end
end
