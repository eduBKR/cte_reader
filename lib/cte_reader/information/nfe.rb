module Cte
  module Reader
    class Nfe
      include AttributeHelper
      include CreatorHelper

      attr_reader :key, :pin, :date, :transport_unit,
        :cargo_unit

      def initialize(attrs = {})
        # Chave da NFe
        @key = attrs[:chave]
        # PIN SUFRAMA
        @pin = attrs[:PIN]
        # Data Previsao
        @date = attrs[:dPrev]

        # Unidade de Transporte
        if attrs[:infUnidTransp]
          @transport_unit = create_resources(TransportUnit, attrs[:infUnidTransp])
        end

        # Unidade de Carga
        if attrs[:infUnidCarga]
          @cargo_unit = create_resources(CargoUnit, attrs[:infUnidCarga])
        end
      end
    end
  end
end