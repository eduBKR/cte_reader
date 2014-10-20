module Cte
  module Reader
    class Railway
      include AttributeHelper
      include CreatorHelper

      attr_reader :kind, :flow, :train, :value, :responsible,
        :railroad_emitter, :railroads, :wagons

      # == Fields Values
      #
      # tpTraf: 0-Próprio;
      #         1-Mútuo;
      #         2-Rodoferroviario;
      #         3-Rodoviario.
      #
      # respFat, ferrEmi: 1-Ferrovia de origem;
      #                   2-Ferrovia de destino
      #
      def initialize(attrs = {})
        # Tipo de trafico
        @kind = attrs[:tpTraf]
        # Fluxo ferroviario
        @flow = attrs[:fluxo]
        # Trem
        @train = attrs[:idTrem]
        # Valor do frete
        @value = attrs[:vFrete]

        if attrs[:trafMut]
          # Responsavel pelo faturamento
          @responsible = attrs[:trafMut][:respFat]
          # Ferrovia Emitente do CTe
          @railroad_emitter = attrs[:trafMut][:ferrEmi]
        end

        # Ferovias
        if attrs[:ferroEnv]
          @railroads = create_resources(Railroad, attrs[:ferroEnv])
        end

        # Vagoes
        if attrs[:detVag]
          @wagons = create_resources(Wagon, attrs[:detVag])
        end
      end
    end
  end
end