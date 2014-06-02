require 'workflow_status'

describe WorkflowStatus::InstanceMethods do

  before :each do
    class DummyClass
      extend WorkflowStatus
    end

    @class = DummyClass
    @obj = DummyClass.new
  end

  it 'adds a method for retreiving workflow_status' do
    @obj.should respond_to(:workflow_status)
  end
  
  it 'adds a method for setting workflow_status' do
    @obj.should respond_to(:'workflow_status=')
  end
  
  describe '#published?' do
    it "checks if the workflow_status attr corresponds to the 'published' value" do
      obj1 = @class.new
      obj2 = @class.new

      obj1.stub(:workflow_status) { :published }
      obj2.stub(:workflow_status) { 'foo' }

      obj1.published?.should be true
      obj2.published?.should be false
    end
  end
end
