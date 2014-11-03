module CteReader
  class Airway
    include AttributeHelper

    attr_reader :minuta, :number, :date, :emitter, :emitter_id,
      :tax_class, :tax_code, :tax_value, :dimensions, :info,
      :imp

    def initialize(attrs = {})
      # Numero da Minuta
      @minuta = attrs[:nMinu]
      # Numero conhecimento Aerio
      @number = attrs[:nOCA]
      # Data Previsao
      @date = attrs[:dPrevAereo]
      # Identificacao do Emissor
      @emitter = attrs[:xLAgEmi]
      # Identificacao interna do Emissor
      @emitter_id = attrs[:IdT]

      if attrs[:tarifa]
        # Classe
        @tax_class = attrs[:tarifa][:CL]
        # Codigo da Tarifa
        @tax_code = attrs[:tarifa][:cTar]
        # Valor da Tarifa
        @tax_value = attrs[:tarifa][:vTar]
      end

      if attrs[:natCarga]
        # Dimensao
        @dimensions = attrs[:natCarga][:xDime]
        # informacoes de manuseio
        @info = attrs[:natCarga][:cInfManu]
        # Codigo Interline Message Procedure
        @imp = attrs[:natCarga][:cIMP]
      end
    end
  end
end