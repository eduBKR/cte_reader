module Cte
  module Reader
    class Railroad
      include AttributeHelper

      attr_reader :cnpj, :code, :state_registration, :name,
        :address

      def initialize(attrs = {})
        # CNPJ
        @cnpj = attrs[:CNPJ]
        # Identificacao
        @code = attrs[:cInt]
        # Incricao Estadual
        @state_registration = attrs[:IE]
        # Name
        @name = attrs[:xNome]

        # Endereco
        if attrs[:enderFerro]
          @address = Address.new(attrs[:enderFerro])
        end
      end
    end
  end
end