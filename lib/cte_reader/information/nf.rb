module Cte
  module Reader
    class Nf
      include AttributeHelper
      include CreatorHelper

      attr_reader :romaneio, :request_number, :model, :serie,
        :number, :date, :icms_base, :icms, :icms_st_base,
        :icms_st, :product_value, :total, :cfop, :weight, 
        :pin, :delivery_date, :transport_unit, :cargo_unit

      def initialize(attrs = {})
        # Romaneio
        @romaneio = attrs[:nRoma]
        # Numero Pedido
        @request_number = attrs[:nPed]
        # Modelo
        @model = attrs[:mod]
        # Serie
        @serie = attrs[:serie]
        # Numero
        @number = attrs[:nDoc]
        # Data de Emissao
        @date = attrs[:dEmi]
        # Base de Calculo ICMS
        @icms_base = attrs[:vBC]
        # Valor ICMS
        @icms = attrs[:vICMS]
        # Base ICMS ST
        @icms_st_base = attrs[:vBCST]
        # Valor ICMS ST
        @icms_st = attrs[:vST]
        # Valor Produtos
        @product_value = attrs[:vProd]
        # Valor Nota Fiscal
        @total = attrs[:vNF]
        # CFOP
        @cfop = attrs[:nCFOP]
        # Peso
        @weight = attrs[:nPeso]
        # PIN SUFRAMA
        @pin = attrs[:PIN]
        # Data de previsao de Entrega
        @delivery_date = attrs[:dPrev]

        # Unidade de Transporte
        if attrs[:infUnidTransp]
          @transport_unit = create_resources(TransportUnit, attrs[:infUnidTransp])
        end

        # Unidade de Carga
        if attrs[:infUnidCarga]
          @cargo_unit = create_resources(CargoUnit, attrs[:infUnidCarga])
        end
      end
    end
  end
end