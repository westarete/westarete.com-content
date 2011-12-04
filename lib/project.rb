require 'uri'
require 'content_model'

class Project < ContentModel
  required_attributes :name, :site_url, :description
  validates_format_of :site_url, :with => URI.regexp
  markdown_support_for :description
  create_id_from :name
end