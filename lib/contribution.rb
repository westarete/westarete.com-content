require 'active_model'
require 'redcarpet'
require 'unindent'

class Contribution
  attr_accessor :name, :site_url, :description

  include ActiveModel::Validations
  validates_presence_of :name, :site_url, :description

  def description_in_markdown=(text)
    @description = Redcarpet.new(text.unindent).to_html
  end
end
