module Cte
  module Reader
    class Duplicate
      include AttributeHelper

      attr_reader :number, :expiration, :value

      def initialize(attrs = {})
        # Numero
        @number = attrs[:nDup]
        # Vencimento
        @expiration = attrs[:dVenc]
        # Valor
        @value = attrs[:vDup]
      end
    end
  end
end