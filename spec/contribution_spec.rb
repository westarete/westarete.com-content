require 'spec_helper'

describe Contribution do
  it { should have_an_attribute :name }
  it { should have_an_attribute :site_url }
  it { should have_an_attribute :description }
end
