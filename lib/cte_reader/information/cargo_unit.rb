module Cte
  module Reader
    class CargoUnit
      include AttributeHelper
      include CreatorHelper

      attr_reader :kind, :code, :amount, :seals

      # == Fields Values
      #
      # tpUnidCarga: 1 - Container
      #              2 - ULD
      #              3 - Pallet
      #              4 - Outros
      #
      def initialize(attrs = {})
        # Tipo de Unidade
        @kind = attrs[:tpUnidCarga]
        # Identificacao da Unidade
        @code = attrs[:idUnidCarga]
        # Quantidade Rateada
        @amount = attrs[:qtdRat]
        
        # Selos
        if attrs[:lacUnidCarga]
          @seals = to_array(attrs[:lacUnidCarga])
        end
      end
    end
  end
end