require 'spec_helper'

describe "An instance of Contribution" do
  subject { Contribution.new }

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

  it 'should define an id based on its name' do
    subject.name = ' Contribution  Name!'
    subject.id.should == 'contribution-name'
  end
end
