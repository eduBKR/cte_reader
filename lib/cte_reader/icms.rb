module Cte
  module Reader
    class Icms
      attr_reader :cst, :icms_base, :icms_percentage, :icms, 
        :icms_base_reduction, :icms_st_base_retained_sender,
        :icms_st_retained, :icms_st_aliquot, :credit,
        :icms_base_reduction_another, :icms_base_another,
        :icms_percentage_another, :icms_another, :simple

      def initialize(attrs = {})
        # Tributação do ICMS
        @cst = attrs[:CST]
        # Base ICMS
        @icms_base = attrs[:vBC]
        # Percentual ICMS
        @icms_percentage = attrs[:pICMS]
        # Valor ICMS
        @icms = attrs[:vICMS]
        # Percentual Redução Base ICMS
        @icms_base_reduction = attrs[:pRedBC]
        # Valor do BC do ICMS ST Retido
        @icms_st_base_retained_sender = attrs[:vBCSTRet]
        # Valor da BC do ICMS ST retido
        @icms_st_retained = attrs[:vICMSSTRet]
        # Aliquota ICMS ST Retido UF Remetente
        @icms_st_aliquot = attrs[:pICMSSTRet]
        # Valor do Credito Outorgado/Presumido
        @credit = attrs[:vCred]
        # Reducao Base outro Estado
        @icms_base_reduction_another = attrs[:pRedBCOutraUF]
        # Base outro Estado
        @icms_base_another = attrs[:vBCOutraUF]
        # Percentual outro Estado
        @icms_percentage_another = attrs[:pICMSOutraUF]
        # Valor ICMS outro estado
        @icms_another = attrs[:vICMSOutraUF]
        #Simples Nacional
        @simple = attrs[:indSN]
      end
    end
  end
end