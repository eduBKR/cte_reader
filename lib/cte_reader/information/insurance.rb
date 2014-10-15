module Cte
  module Reader
    class Insurance
      include AttributeHelper

      attr_reader :responsible, :insurer, :policy,
        :registration, :value

      # == Fields Values
      #
      # respSeg: 0- Remetente;
      #          1- Expedidor;
      #          2 - Recebedor;
      #
      def initialize(attrs = {})
        # Responsavel
        @responsible = attrs[:respSeg]
        # Nome da Seguradora
        @insurer = attrs[:xSeg]
        # Numero da Apolice
        @policy = attrs[:nApol]
        # Numero da Averbacao
        @registration = attrs[:nAver]
        # Valor da Carga
        @value = attrs[:vCarga]
      end
    end
  end
end