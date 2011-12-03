RSpec::Matchers.define :have_an_attribute do |attribute_name|
  match do |object|
    object.send("#{attribute_name}=", 'something')
    object.send(attribute_name) == 'something'
  end
end

RSpec::Matchers.define :have_markdown_support_for do |attribute_name|
  match do |object|
    object.send("#{attribute_name}_in_markdown=", %{
      This is in *markdown* format.
    })
    object.send(attribute_name).strip == '<p>This is in <em>markdown</em> format.</p>'
  end
end