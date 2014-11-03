module CteReader
  class Complement
    include AttributeHelper
    include CreatorHelper

    attr_accessor :transport_feature, :service_feature, :employee, :city_start,
      :city_end, :observation, :taxpayer_messages, :messages, :origin, :destination,
      :route, :passage, :date_kind, :date, :date_start, :date_end, :hour_kind,
      :hour, :hour_start, :hour_end

    # == Fields Values
    #
    # tpPer: 0- Sem data definida;
    #        1- Na data;
    #        2- Até a data;
    #        3- A partir da data;
    #        4- No período
    #
    # tpHor: 0- Sem hora definida
    #        1- No horário;
    #        2- Até o horário;
    #        3- A partir do horário
    #

    def initialize(attrs = {})
      # Caracteristica Adicional Transporte
      @transport_feature = attrs[:xCaracAd]
      # Caracteristica Adicional Servico
      @service_feature = attrs[:xCaracSer]
      # Funcionário emissor
      @employee = attrs[:xEmi]
      # Cidade de Inicio
      @city_start = attrs[:origCalc]
      # Cidade de Entrega
      @city_end = attrs[:destCalc]
      # Observacoes
      @observation = attrs[:xObs]
      # Observacao do Contribuinte
      @taxpayer_messages = to_array(attrs[:ObsCont]) if attrs[:ObsCont]
      # Observacao do Contribuinte ao Fisco
      @messages = to_array(attrs[:ObsCont]) if attrs[:ObsFisco]

      # Previsao do fluxo da carga
      if attrs[:fluxo]
        # Local Origem
        @origin = attrs[:fluxo][:xOrig]
        # Local de Destino
        @destination = attrs[:fluxo][:xDest]
        # Rota
        @route = attrs[:fluxo][:xRota]

        # Locais de Passagem
        if attrs[:fluxo][:pass]
          @passage = to_array(attrs[:fluxo][:pass])
        end
      end

      # Prazo de Entrega
      if attrs[:Entrega]
        # Possui Data
        if attrs[:Entrega][:comData]
          # Tipo de Prazo - Data
          @date_kind = attrs[:Entrega][:comData][:tpPer]
          # Data programada
          @date = attrs[:Entrega][:comData][:dProg]
          
        end

        # Sem Data
        if attrs[:Entrega][:semData]
          # Tipo de Prazo - Data
          @date_kind = attrs[:Entrega][:semData][:tpPer]
        end

        # No Periodo
        if attrs[:Entrega][:noPeriodo]
          # Tipo de Prazo - Data
          @date_kind = attrs[:Entrega][:noPeriodo][:tpPer]
          # DAta Inicial
          @date_start = attrs[:Entrega][:noPeriodo][:dIni]
          # Data Final
          @date_end = attrs[:Entrega][:noPeriodo][:dFim]
        end

        # Sem Hora
        if attrs[:Entrega][:semHora]
          # Tipo do Prazo - Hora
          @hour_kind = attrs[:Entrega][:semHora][:tpHor]
        end

        # Com Hora
        if attrs[:Entrega][:comHora]
          # Tipo do Prazo - Hora
          @hour_kind = attrs[:Entrega][:comHora][:tpHor]
          # Hora
          @hour = attrs[:Entrega][:comHora][:hProg]
        end

        # No Intervalo
        if attrs[:Entrega][:noInter]
          # Tipo do Prazo - Hora
          @hour_kind = attrs[:Entrega][:noInter][:tpHor]
          # Hora Inicial
          @hour_start = attrs[:Entrega][:noInter][:hIni]
          # Hora Final
          @hour_end = attrs[:Entrega][:noInter][:hFim]
        end
      end
    end
  end
end