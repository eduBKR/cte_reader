module Cte
  module Reader
    class Wagon
      include AttributeHelper

      attr_reader :number, :capacity, :kind,
        :actual_weight, :weight

      def initialize(attrs = {})
        # Numero do Vagao
        @number = attrs[:nVag]
        # Capacidade em Toneladas
        @capacity = attrs[:cap]
        # Tipo de Vagao
        @kind = attrs[:tpVag]
        # Peso Real
        @actual_weight = attrs[:pesoR]
        # Peso base de Calculo
        @weight = attrs[:pesoBC]
      end
    end
  end
end