module CteReader
  # Tomador do Servico
  class Taker
    attr_reader :person, :address

    def initialize(attrs = {})
      # Pessoa
      @person = Person.new(attrs)

      # Endereco
      if attrs[:enderToma]
        @address = Address.new(attrs[:enderToma])
      end
    end
  end
end