module CteReader
  class Recipient
    include AttributeHelper

    attr_reader :person, :address, :local

    def initialize(attrs = {})
      # Pessoa
      @person = Person.new(attrs)

      # Endereco
      if attrs[:enderDest]
        @address = Address.new(attrs[:enderDest])
      end

      # Local de Entrega NF
      if attrs[:locEnt]
        @local = Address.new(attrs[:locEnt])
      end
    end
  end
end