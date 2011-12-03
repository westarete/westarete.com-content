require 'spec_helper'

describe "An instance of Contribution" do
  subject { Contribution.new }

  it { should have_an_attribute :name }
  it { should have_an_attribute :site_url }
  it { should have_an_attribute :description }
  it { should validate_presence_of :name }
  it { should validate_presence_of :site_url }
  it { should validate_presence_of :description }
  it { should have_markdown_support_for :description }
end
