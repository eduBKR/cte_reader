module Cte
  module Reader
    class DangerousProduct
      include AttributeHelper

      attr_reader :onu_number, :transport, :risk_class,
        :packing, :amount, :total, :flashpoint

      def initialize(attrs = {})
        # Numero da ONU
        @onu_number = attrs[:nONU]
        # Transporte
        @transport = attrs[:xNomeAE]
        # Clase de Risco
        @risk_class = attrs[:xClaRisco]
        # Grupo de Embalagem
        @packing = attrs[:grEmb]
        # Quantidade
        @amount = attrs[:qTotProd]
        # Total do Produto
        @total = attrs[:qVolTipo]
        # Ponto de Fulgor
        @flashpoint = attrs[:pontoFulgor]
      end
    end
  end
end