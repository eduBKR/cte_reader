module CteReader
  class Sender
    attr_reader :person, :address, :local

    def initialize(attrs = {})
      # Pessoa
      @person = Person.new(attrs)

      # Endereco
      if attrs[:enderReme]
        # Logradouro
        @address = Address.new(attrs[:enderReme])
      end

      # Local de Coleta
      if attrs[:locColeta]
        @local = Address.new(attrs[:locColeta])
      end
    end
  end
end