require 'uri'
require 'content_model'

class Project < ContentModel
  required_attributes :name, :site_url, :description, :names_of_services_provided
  validates_format_of :site_url, :with => URI.regexp
  markdown_support_for :description
  create_id_from :name

  def services_provided
    @names_of_services_provided.map do |name|
      Service.find(:name, name)
    end
  end
end