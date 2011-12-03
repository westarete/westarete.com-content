RSpec::Matchers.define :have_an_attribute do |attribute_name|
  match do |object|
    object.send("#{attribute_name}=", 'something')
    object.send(attribute_name) == 'something'
  end
end
