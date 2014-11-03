module CteReader
  class Service
    include AttributeHelper
    include CreatorHelper

    attr_reader :total, :value, :components

    def initialize(attrs = {})
      # Valor Total do Servico
      @total = attrs[:vTPrest]
      # Valor a Receber
      @value = attrs[:vRec]
      # Componentes do Valor
      @components = to_array(attrs[:Comp])
    end
  end
end