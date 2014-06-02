require 'workflow_status'

describe WorkflowStatus do

  it 'adds a class method for returning status names as symbols' do
    class DummyClass; end
    DummyClass.extend WorkflowStatus
  
    DummyClass.workflow_statuses.should include(:unpublished) 
    DummyClass.workflow_statuses.should include(:published) 
    DummyClass.workflow_statuses.should include(:trashed) 
  end

end
