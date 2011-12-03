require 'active_model'

class Contribution
  attr_accessor :name, :site_url, :description

  include ActiveModel::Validations
  validates_presence_of :name, :site_url, :description

end
