module Cte
  module Reader
    class TransportUnit
      include AttributeHelper
      include CreatorHelper

      attr_reader :kind, :code, :seals, :cargo_units

      def initialize(attrs = {})
        # Tipo de Transporte
        @kind = attrs[:tpUnidTransp]
        # Identificacao do Treansporte
        @code = attrs[:idUnidTransp]
        
        # Selos
        if attrs[:lacUnidTransp]
          @seals = to_array(attrs[:lacUnidTransp])
        end

        # Unidade de Carga
        if attrs[:infUnidCarga]
          @cargo_units = create_resources(CargoUnit, attrs[:infUnidCarga])
        end
      end
    end
  end
end