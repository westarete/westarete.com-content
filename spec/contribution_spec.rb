require 'spec_helper'

describe "An instance of Contribution" do
  subject { Contribution.new }

  it { should have_an_attribute :name }
  it { should have_an_attribute :site_url }
  it { should have_an_attribute :description }
  it { should validate_presence_of :name }
  it { should validate_presence_of :site_url }
  it { should validate_presence_of :description }

  context 'with a description in markdown format' do
    before do
      @contribution = Contribution.new
      @contribution.description_in_markdown = %{
        This is in *markdown* format.
      }
    end
    it 'should convert it to HTML' do
      @contribution.description.strip.should == '<p>This is in <em>markdown</em> format.</p>'
    end
  end
end
