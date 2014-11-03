module CteReader
  class Billing
    include AttributeHelper
    include CreatorHelper

    attr_reader :number, :value, :descont, :value_net, :duplicates
    
    def initialize(attrs = {})
      if attrs[:fat]
        # Numero
        @number = attrs[:fat][:nFat]
        # Valor
        @value = attrs[:fat][:vOrig]
        # Desconto
        @descont = attrs[:fat][:vDesc]
        # Valor Liquido
        @value_net = attrs[:fat][:vLiq]
      end

      # Duplicatas
      @duplicates = create_resources(Duplicate, attrs[:dup])
    end
  end
end