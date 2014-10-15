module Cte
  module Reader
    class Pipeline
      include AttributeHelper

      attr_reader :value, :date_start, :date_end

      def initialize(attrs = {})
        # Valor da tarifa
        @value = attrs[:vTar]
        # Data inicio
        @date_start = attrs[:dIni]
        # Data fim
        @date_end = attrs[:dFim]
      end
    end
  end
end