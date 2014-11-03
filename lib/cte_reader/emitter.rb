module CteReader
  class Emitter
    attr_reader :person, :address

    def initialize(attrs = {})
      # Pessoa
      @person = Person.new(attrs)

      # Endereco
      if attrs[:enderEmit]
        @address = Address.new(attrs[:enderEmit])
      end
    end
  end
end