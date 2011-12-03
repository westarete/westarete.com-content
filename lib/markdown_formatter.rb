require 'redcarpet'
require 'unindent'

module MarkdownFormatter
  module ClassMethods
    def markdown_support_for(*attribute_names)
      attribute_names.each do |attribute_name|
        define_markdown_setter_for(attribute_name)
      end
    end

    def define_markdown_setter_for(attribute_name)
      define_method("#{attribute_name}_in_markdown=") do |text|
        instance_variable_set("@#{attribute_name}", convert_indented_markdown_to_html(text))
      end
    end
  end

  def convert_indented_markdown_to_html(text)
    Redcarpet.new(text.unindent).to_html
  end
end
