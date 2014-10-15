module Cte
  module Reader
    class Toll
      include AttributeHelper

      attr_reader :cnpj_supplier, :number, :cnpj_paying,
        :value

      def initialize(attrs = {})
        # CNPJ do Fornecedor do vale pedagio
        @cnpj_supplier = attrs[:CNPJForn]
        # Numero de Compra
        @number = attrs[:nCompra]
        # CNPJ Pagador
        @cnpj_paying = attrs[:CNPJPg]
        # Valor do vale
        @value = attrs[:vValePed]
      end
    end
  end
end