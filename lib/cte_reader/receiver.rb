module Cte
  module Reader
    class Receiver
      attr_reader :person, :address

      def initialize(attrs = {})
        # Pessoa
        @person = Person.new(attrs)

        # Endereco
        if attrs[:enderReceb]
          @address = Address.new(attrs[:enderReceb])
        end
      end
    end
  end
end