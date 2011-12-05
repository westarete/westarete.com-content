require 'active_model'
require 'markdown_formatter'
require 'id_creator'

class NotFoundError < Exception ; end

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

  def self.create
    object = self.new
    yield object if block_given?
    object.save
    object
  end

  def self.find(attribute_name, value_to_match)
    all.detect { |o| o.send(attribute_name) == value_to_match } or
      raise NotFoundError,
        "Couldn't find a #{self.class} where #{attribute_name} is \"#{value_to_match}\""
  end

  def self.find_all(attribute_name, value_to_match)
    all.select { |o| o.send(attribute_name) == value_to_match }
  end

  def save
    self.class.all << self
  end
end