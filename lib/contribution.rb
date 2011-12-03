require 'active_model'
require 'markdown_formatter'

class Contribution
  attr_accessor :name, :site_url, :description

  include ActiveModel::Validations
  validates_presence_of :name, :site_url, :description

  include MarkdownFormatter
  extend MarkdownFormatter::ClassMethods
  markdown_support_for :description
end
