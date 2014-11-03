module CteReader
  class Waterway
    include AttributeHelper
    include CreatorHelper

    attr_reader :value, :afrmm, :booking, :number, :ship,
      :travel_number, :direction, :embarkation, :transshipment,
      :destiny, :ship_kind, :irin, :ferry


    # == Fields Values
    #
    # direc: N-Norte, L-Leste, S-Sul, O-Oeste
    #
    # tpNav: 0 - Interior; 1 - Cabotagem
    #
    def initialize(attrs = {})
      # Valor Prestacao AFRMM
      @value = attrs[:vPrest]
      # Valor AFRMM
      @afrmm = attrs[:vAFRMM]
      # Numero da Reserva
      @booking = attrs[:nBooking]
      # Numero do Controle
      @number = attrs[:nCtrl]
      # Navio
      @ship = attrs[:xNavio]
      # Numero da Viagem
      @travel_number = attrs[:nViag]
      # Direcao
      @direction = attrs[:direc]
      # Porto de Embarque
      @embarkation = attrs[:prtEmb]
      # Porto de Transbordo
      @transshipment = attrs[:prtTrans]
      # Porto de Destino
      @destiny = attrs[:prtDest]
      # Tipo de Navegacao
      @ship_kind = attrs[:tpNav]
      # Irin do navio
      @irin = attrs[:irin]

      # Balsas
      if attrs[:balsa]
        @ferry =  to_array(attrs[:balsa])
      end
    end
  end
end