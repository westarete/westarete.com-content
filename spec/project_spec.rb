require 'spec_helper'

describe Project do
  it_behaves_like 'a ContentModel'

  it { should have_an_attribute :name }
  it { should validate_presence_of :name }

  it { should have_an_attribute :site_url }
  it { should validate_presence_of :site_url }
  it 'should validate the format of site_url' do
    subject.should validate_format_of(:site_url).with('http://example.com/')
    subject.should validate_format_of(:site_url).not_with('example.com')
  end

  it { should have_an_attribute :description }
  it { should validate_presence_of :description }
  it { should have_markdown_support_for :description }

  it { should have_an_id_based_on(:name) }

end