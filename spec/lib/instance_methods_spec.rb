require 'workflow_status'

describe WorkflowStatus::InstanceMethods do

  before :each do
    class DummyClass
      extend WorkflowStatus
    end

    @obj = DummyClass.new
  end

  it 'adds a method for retreiving workflow_status' do
    @obj.should respond_to(:workflow_status)
  end
  
  skip 'adds a method for setting workflow_status' do
    @obj.should respond_to(:'workflow_status=')
  end
  
  skip '#published?' do
    it "checks if the workflow_status attr corresponds to the 'published' value" do
      class DummyClass
        extend WorkflowStatus
      end

      obj1 = DummyClass.new
      obj2 = DummyClass.new

      obj1.stub(:workflow_status) { 1 }
      obj2.stub(:workflow_status) { 'foo' }

      obj1.published?.should be_true
      obj2.published?.should be_false
    end
  end
end
