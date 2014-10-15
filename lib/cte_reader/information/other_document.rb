module Cte
  module Reader
    class OtherDocument
      include AttributeHelper
      include CreatorHelper

      attr_reader :kind, :description, :date,
        :value, :delivery_date, :transport_unit,
        :cargo_unit

      # == Fields Values
      #
      # tpDoc: 00 - Declaração;
      #        10 - Dutoviário;
      #        99 - Outros
      #
      def initialize(attrs = {})
        # Tipo do Documneto
        @kind = attrs[:tpDoc]
        # Descricao
        @description = attrs[:descOutros]
        # Data
        @date = attrs[:dEmi]
        # Valor
        @value = attrs[:vDocFisc]
        # Data de Previsao de Entrega
        @delivery_date = attrs[:dPrev]

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