module CteReader
  class Multimodal
    include AttributeHelper

    attr_reader :cotm, :negotiable

    def initialize(attrs = {})
      # Numero do Certificado do Operador
      @cotm = attrs[:COTM]
      # Indicador de Negociavel
      @negotiable = attrs[:indNegociavel]
    end
  end
end