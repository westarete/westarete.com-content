require 'active_model'
require 'markdown_formatter'
require 'id_creator'

class ContentModel
  include ActiveModel::Validations

  include MarkdownFormatter
  extend MarkdownFormatter::ClassMethods

  include IdCreator
  extend IdCreator::ClassMethods

  def self.required_attributes(*attribute_names)
    attr_accessor(*attribute_names)
    validates_presence_of(*attribute_names)
  end

  def self.required_attribute(attribute_name)
    required_attributes(attribute_name)
  end

  def self.all
    @instances ||= []
  end

  def self.count
    all.length
  end

  def save
    self.class.all << self
  end
end