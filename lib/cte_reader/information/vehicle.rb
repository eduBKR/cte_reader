module CteReader
  class Vehicle
    include AttributeHelper

    attr_reader :chassi, :color, :color_name,
     :model, :value, :freight, :code, :renavam,
     :plate, :tara_pound, :capacity_pound, :capacity_meter,
     :capacity_meter, :owner_kind, :kind, :wheel_kind, :body_kind,
     :state, :owner

    # == Fields Values
    #
    # tpProp: P- Próprio; T- terceiro
    #
    # tpRod: 00 - Nao aplicavel;
    #        01 - Truck;
    #        02 - Toco;
    #        03 - Cavalo Mecanico;
    #        04 - VAN;
    #        05 - Utilitario;
    #        06 - Outros.
    #
    # tpCar: 00 - Nao aplicavel;
    #        01 - Aberta;
    #        02 - Fechada/Bau;
    #        03 - Granelera;
    #        04 - Porta Container;
    #        05 - Sider
    #
    def initialize(attrs = {})
      # Numero do Chassi
      @chassi = attrs[:chassi]
      # Codigo da Cor
      @color = attrs[:cCor]
      # Nome da Cor
      @color_name = attrs[:xCor]
      # Modelo
      @model = attrs[:cMod]
      # Valor Unitario
      @value = attrs[:vUnit]
      # Valor do Frete
      @freight = attrs[:vFrete]

      #== Modal Rodoviario
      #
      # Codigo Interno
      @code = attrs[:cInt]
      # RENAVAM
      @renavam = attrs[:RENAVAM]
      # Placa
      @plate = attrs[:placa]
      # Tara KG
      @tara_pound = attrs[:tara]
      # Capacidade KG
      @capacity_pound = attrs[:capKG]
      # Capacidade M3
      @capacity_meter = attrs[:capM3]
      # Tipo de Proprietario
      @owner_kind = attrs[:tpProp]
      # Tipo de Veiculo
      @kind = attrs[:tpVeic]
      # Tipo de Rodado
      @wheel_kind = attrs[:tpRod]
      # Tipo de Carroceria
      @body_kind = attrs[:tpCar]
      # Estado
      @state = attrs[:UF]

      # Proprietario do Veiculo
      if attrs[:prop]
        @owner = Person.new(attrs[:prop])
      end
    end
  end
end