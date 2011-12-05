require 'content_model'

class ProjectCategory < ContentModel
  required_attribute :name
  create_id_from :name

  def projects
    Project.find_all(:category_name, name)
  end
end