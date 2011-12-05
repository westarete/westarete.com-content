require 'content_model'

class Service < ContentModel
  required_attributes :name, :short_name, :description, :name_of_featured_project
  markdown_support_for :description
  create_id_from :name

  def featured_project
    Project.find(:name, @name_of_featured_project)
  end
end
