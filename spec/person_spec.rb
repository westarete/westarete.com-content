require 'spec_helper'

describe 'An instance of Person' do
  subject { Person.new }

  it { should have_an_attribute :name }
  it { should validate_presence_of :name }

  it { should have_an_attribute :title }
  it { should validate_presence_of :title }

  it { should have_an_attribute :email }
  it { should validate_presence_of :email }

  it { should have_an_attribute :description }
  it { should validate_presence_of :description }
  it { should have_markdown_support_for :description }

  it { should have_an_id_based_on(:name) }
end