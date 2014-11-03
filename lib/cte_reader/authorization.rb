module CteReader
  class Authorization
    include AttributeHelper

    attr_reader :cnpj, :cpf

    def initialize(attrs = {})
      @cnpj = attrs[:CNPJ]
      @cpf = attrs[:CPF]
    end
  end
end