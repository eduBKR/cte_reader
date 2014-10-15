module Cte
  module Reader
    class Cargo
      include AttributeHelper
      include CreatorHelper

      attr_reader :total, :product, :characteristics, :amount

      def initialize(attrs = {})
        # Valor Carga
        @total = attrs[:vCarga]
        # Produto predominante
        @product = attrs[:proPred]
        # Outras Caracteristicas da Carga
        @characteristics = attrs[:xOutCat]

        # Quantidades da Carga
        if attrs[:infQ]
          @amount = create_resources(Amount, attrs[:infQ])
        end
      end
    end
  end
end