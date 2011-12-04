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
    @id = strip(join(escape(values)))
  end

  def to_s
    @id
  end

  private

  def escape(values)
    values.map { |v| escape_one_value(v) }
  end

  def escape_one_value(value)
    value.downcase.gsub(disallowed_characters, JOIN_CHARACTER)
  end

  def disallowed_characters
    /[^a-z0-9]+/i
  end

  def join(values)
    values.join(JOIN_CHARACTER)
  end

  def strip(string)
    string.gsub(/^#{JOIN_CHARACTER}+/, '').gsub(/#{JOIN_CHARACTER}+$/, '')
  end
end