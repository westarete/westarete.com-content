require 'spec_helper'

describe Service do
  it_behaves_like 'a ContentModel'

  it { should have_an_attribute :name }
  it { should validate_presence_of :name }
  it { should have_an_id_based_on(:name) }

  it { should have_an_attribute :short_name }
  it { should validate_presence_of :short_name }

  it { should have_an_attribute :description }
  it { should validate_presence_of :description }
  it { should have_markdown_support_for :description }

  it { should have_an_attribute :name_of_featured_project }
  it { should validate_presence_of :name_of_featured_project }

  describe '#featured_project' do
    let(:service) { Service.new }
    let(:result) { service.featured_project }
    context 'when a valid project name has been assigned' do
      let(:expected_project) do
        Project.create { |p| p.name = 'athletictravel.com' }
      end
      before do
        service.name_of_featured_project = expected_project.name
      end
      it 'should return the matching project object' do
        result.should be(expected_project)
      end
    end
    context 'when an unknown project name has been assigned' do
      before do
        service.name_of_featured_project = 'something else'
      end
      it 'should raise a NotFoundError' do
        expect { result }.to raise_error NotFoundError
      end
    end
    context 'when no project name has been assigned' do
      it 'should raise a NotFoundError' do
        expect { result }.to raise_error NotFoundError
      end
    end
  end
end