module CteReader
  class Dispatcher
    attr_reader :person, :address

    def initialize(attrs = {})
      # Pessoa
      @person = Person.new(attrs)

      # Endereco
      if attrs[:enderExped]
        @address = Address.new(attrs[:enderExped])
      end
    end
  end
end