module Cte
  module Reader
    class Amount
      include AttributeHelper

      attr_reader :amount, :kind, :unit

      # == Fields Values
      # 
      # cUnid: 00-M3;
      #        01-KG;
      #        02-TON;
      #        03-UNIDADE;
      #        04-LITROS;
      #        05-MMBTU
      #
      def initialize(attrs = {})
        # Quantidade da Carga
        @amount = attrs[:qCarga]
        # Tipo de Medida
        @kind = attrs[:tpMed]
        # Unidade de Medida
        @unit = attrs[:cUnid]
      end
    end
  end
end