require 'spec_helper'

describe Project do
  it_behaves_like 'a ContentModel'

  it { should have_an_attribute :name }
  it { should validate_presence_of :name }
  it { should have_an_id_based_on(:name) }

  it { should have_an_attribute :category_name }
  it { should validate_presence_of :category_name }

  it { should have_an_attribute :site_url }
  it { should validate_presence_of :site_url }
  it 'should validate the format of site_url' do
    subject.should validate_format_of(:site_url).with('http://example.com/')
    subject.should validate_format_of(:site_url).not_with('example.com')
  end

  it { should have_an_attribute :description }
  it { should validate_presence_of :description }
  it { should have_markdown_support_for :description }

  it { should have_an_attribute :names_of_services_provided }
  it { should validate_presence_of :names_of_services_provided }

  describe '#services_provided' do
    let!(:cms) do
      Service.create { |s| s.name = 'Content Management Systems' }
    end
    let!(:hosting) do
      Service.create { |s| s.name = 'Hosting and Support' }
    end
    let!(:ixd) do
      Service.create { |s| s.name = 'Interaction Design' }
    end
    let(:project) { Project.new }
    let(:result) { project.services_provided }
    context 'when all service names are recognized' do
      before do
        project.names_of_services_provided = [
          'Content Management Systems',
          'Hosting and Support'
        ]
      end
      it 'should return the matching set of services' do
        result.should == [cms, hosting]
      end
    end
    context 'when one of the service names is not recognized' do
      before do
        project.names_of_services_provided = [
          'Content Management Systems',
          'Something Unrecognized'
        ]
      end
      it 'should raise a NotFoundError' do
        expect { result }.to raise_error(NotFoundError)
      end
    end
  end
end