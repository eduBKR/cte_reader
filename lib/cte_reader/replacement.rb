module Cte
  module Reader
    class Replacement
      include AttributeHelper

      attr_reader :key, :nfe_key, :cnpj, :cpf, :model,
        :serie, :subserie, :number, :value, :date, :cancellation

      def initialize(attrs = {})
        # Chave CTe original
        @key = attrs[:chCte]
        
        # Tomador Contribuinte ICMS
        if attrs[:tomaICMS]
         # NFe
         @nfe_key = attrs[:tomaICMS][:refNFe]

         if attrs[:tomaICMS][:refNF]
            # CNPJ
            @cnpj = attrs[:tomaICMS][:refNF][:CNPJ]
            # CPF
            @cpf = attrs[:tomaICMS][:refNF][:CPF]
            # Modelo
            @model = attrs[:tomaICMS][:refNF][:mod]
            # Serie
            @serie = attrs[:tomaICMS][:refNF][:serie]
            # Subserie
            @subserie = attrs[:tomaICMS][:refNF][:subserie]
            # Numero
            @number = attrs[:tomaICMS][:refNF][:nro]
            # Valor
            @value = attrs[:tomaICMS][:refNF][:valor]
            # Data Emissao
            @date = attrs[:tomaICMS][:refNF][:dEmi]
         end
        end

        # Nao Contribuinte ICMS
        if attrs[:tomaNaoICMS]
          # Chave de acesso do CT-e de Anulacao
          @cancellation = attrs[:tomaNaoICMS][:refCteAnu]
        end
      end
    end
  end
end