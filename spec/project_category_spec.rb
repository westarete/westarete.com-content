require 'spec_helper'

describe ProjectCategory do
  it_behaves_like 'a ContentModel'

  it { should have_an_attribute :name }
  it { should validate_presence_of :name }
  it { should have_an_id_based_on(:name) }

  describe '#projects' do
    let(:category) do
      ProjectCategory.create { |c| c.name = 'Business'}
    end
    let(:lifeviz) do
      Project.create { |p| p.category_name = 'Academic' }
    end
    let(:result) { category.projects }
    context 'when there are no projects with this category' do
      it 'should return an empty array' do
        result.should be_empty
      end
    end
    context 'when there are projects with this category' do
      let!(:cat) do
        Project.create { |p| p.category_name = 'Business' }
      end
      let!(:paig) do
        Project.create { |p| p.category_name = 'Business' }
      end
      it 'should return each project' do
        result.should == [cat, paig]
      end
    end
  end
end