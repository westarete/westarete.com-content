shared_examples "a ContentModel" do
  describe '.all' do
    before do
      @object1 = described_class.create
      @object2 = described_class.create
      @object3 = described_class.create
    end
    it 'should return the objects in the order they were created' do
      described_class.all.should == [@object1, @object2, @object3]
    end
  end
  describe '.count' do
    subject { described_class.count }
    context 'when there are no instances' do
      it { should == 0 }
    end
    context 'when there are 3 instances' do
      before do
        3.times { described_class.new.save }
      end
      it { should == 3 }
    end
  end
  describe '.create' do
    it 'should return a new object' do
      described_class.create.should be_an_instance_of described_class
    end
    it 'should yield the new object as a block variable' do
      described_class.create do |o|
        o.should be_an_instance_of described_class
      end
    end
    it 'should save the object' do
      expect { described_class.create }.to change { described_class.count }.by(1)
    end
  end
  describe '#save' do
    let(:object) { described_class.new }
    it 'should increase the total count by 1' do
      expect { object.save }.to change { described_class.count }.by(1)
    end
    it 'should add the object to the end of .all' do
      object.save
      described_class.all.last.should be(object)
    end
  end
end