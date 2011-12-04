shared_examples "a ContentModel" do
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