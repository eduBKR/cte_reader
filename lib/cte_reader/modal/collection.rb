module Cte
  module Reader
    class Collection
      include AttributeHelper

      attr_reader :serie, :number, :date, :code, :emitter

      def initialize(attrs = {})
        # Serie
        @serie = attrs[:serie]
        # Numero
        @number = attrs[:nOcc]
        # Data de Emissao
        @date = attrs[:dEmi]

        if attrs[:emiOcc]
          # Codigo da Coleta
          @code = attrs[:cInt]
          # Emitente
          @emitter = Person.new(attrs[:emiOcc])
        end
      end
    end
  end
end