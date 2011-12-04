require 'spec_helper'

describe Service do
  it_behaves_like 'a ContentModel'

  it { should have_an_attribute :name }
  it { should validate_presence_of :name }
  it { should have_an_id_based_on(:name) }

  it { should have_an_attribute :description }
  it { should validate_presence_of :description }
  it { should have_markdown_support_for :description }

end