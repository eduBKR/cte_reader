module Cte
  module Reader
    class Tax
      include AttributeHelper
      include CreatorHelper

      attr_reader :icms, :total, :info

      def initialize(attrs = {})
        # Icms
        @icms = create_resources(Icms, attrs[:ICMS])
        # Total de Tributos
        @total = attrs[:vTotTrib]
        # Infomacoes para o Fisco
        @info = attrs[:infAdFisco]
      end
    end
  end
end