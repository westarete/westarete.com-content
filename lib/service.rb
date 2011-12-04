require 'content_model'

class Service < ContentModel
  required_attributes :name, :description
  markdown_support_for :description
  create_id_from :name
end
