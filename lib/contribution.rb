require 'active_model'
require 'markdown_formatter'
require 'id_creator'

class Contribution
  attr_accessor :name, :site_url, :description

  include ActiveModel::Validations
  validates_presence_of :name, :site_url, :description
  validates_format_of :site_url, :with => URI.regexp

  include MarkdownFormatter
  extend MarkdownFormatter::ClassMethods
  markdown_support_for :description

  include IdCreator
  extend IdCreator::ClassMethods
  create_id_from :name
end
