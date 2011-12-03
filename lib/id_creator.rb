module IdCreator
  module ClassMethods
    def create_id_from(*attribute_names)
      @attribute_names_for_id = attribute_names
      define_method :id do
        Id.new(*values_for_id).to_s
      end
    end

    def attribute_names_for_id
      @attribute_names_for_id
    end
  end

  def values_for_id
    self.class.attribute_names_for_id.map { |attr| send(attr) }
  end
end

class Id
  JOIN_CHARACTER = '-'

  def initialize(*values)
    @values = values
    escape_attribute_values
    join_attribute_values
    strip_join_characters
  end

  def to_s
    @id
  end

  private

  def escape_attribute_values
    @values.map! do |value|
      value.downcase.gsub(disallowed_characters, JOIN_CHARACTER)
    end
  end

  def disallowed_characters
    /[^a-z0-9]+/i
  end

  def join_attribute_values
    @id = @values.join(JOIN_CHARACTER)
  end

  def strip_join_characters
    @id = @id.gsub(/^#{JOIN_CHARACTER}+/, '').gsub(/#{JOIN_CHARACTER}+$/, '')
  end
end