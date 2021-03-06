require 'workflow_status'

describe WorkflowStatus do

  before :each do
    @klass = Class.new do
      extend WorkflowStatus
    end
  end

  it 'adds a class method for returning status names as symbols' do
    @klass.workflow_statuses.should include(:unpublished) 
    @klass.workflow_statuses.should include(:published) 
    @klass.workflow_statuses.should include(:trashed) 
  end

  # workflow_status 0
  describe '#unpublished' do
    it 'sends an ActiveRecord query for the correct workflow_status' do
      @klass.should_receive(:where).with(workflow_status: 0) 
      @klass.unpublished
    end
  end
  
  # workflow_status 1
  describe '#published' do
    it 'sends an ActiveRecord query for the correct workflow_status' do
      @klass.should_receive(:where).with(workflow_status: 1) 
      @klass.published
    end
  end
  
  # workflow_status 2
  describe '#trashed' do
    it 'sends an ActiveRecord query for the correct workflow_status' do
      @klass.should_receive(:where).with(workflow_status: 2) 
      @klass.trashed
    end
  end

  describe '#status_options_for_select' do
    it 'returns an array of options suitable for Rails form select helper' do
      @klass.status_options_for_select.should include([:unpublished, 0])
      @klass.status_options_for_select.should include([:published,   1])
      @klass.status_options_for_select.should include([:trashed,     2])
    end
  end
end
