RSpec::Matchers.define :have_an_attribute do |attribute_name|
  match do |object|
    object.send("#{attribute_name}=", 'a value')
    object.send(attribute_name) == 'a value'
  end
  description { "have an attribute :#{attribute_name}" }
end
