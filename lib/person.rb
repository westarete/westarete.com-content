require 'content_model'

class Person < ContentModel
  required_attributes :name, :title, :email, :description
  markdown_support_for :description
  create_id_from :name
end