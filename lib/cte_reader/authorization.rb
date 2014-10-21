module Cte
  module Reader
    class Authorization
      include AttributeHelper

      attr_reader :cnpj, :cpf

      def initialize(attrs = {})
        @cnpj = attrs[:CNPJ]
        @cpf = attrs[:CPF]
      end
    end
  end
end