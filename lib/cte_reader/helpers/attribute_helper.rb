module CteReader
  module AttributeHelper
    WITHELIST = %w(taxpayer_messages messages seals components documents passage ferry)

    def attributes
      @attributes ||= attributes_to_hash
    end

    def attributes_to_hash
      attrs = Hash.new

      instance_variables.each do |var|
        key   = var.to_s.gsub /^@/, ''
        value = instance_variable_get(var)

        attrs[key] = value if [String, Hash].include?(value.class) || WITHELIST.include?(key)
      end

      attrs
    end
  end
end