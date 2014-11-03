module CteReader
  class Cargo
    include AttributeHelper
    include CreatorHelper

    attr_reader :total, :product, :characteristics, :amounts

    def initialize(attrs = {})
      # Valor Carga
      @total = attrs[:vCarga]
      # Produto predominante
      @product = attrs[:proPred]
      # Outras Caracteristicas da Carga
      @characteristics = attrs[:xOutCat]

      # Quantidades da Carga
      if attrs[:infQ]
        @amounts = create_resources(Amount, attrs[:infQ])
      end
    end
  end
end