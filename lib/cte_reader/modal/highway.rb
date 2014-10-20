module Cte
  module Reader
    class Highway
      include AttributeHelper
      include CreatorHelper

      attr_reader :rntrc, :date, :capacity, :ciot, :collections,
        :tolls, :vehicle, :seals, :drivers

      # == Fields Values
      # 
      # lota : 0 Nao - 1 Sim
      def initialize(attrs = {})
        # Registro Nacional de Transportadores Rodoviarios de Carga
        @rntrc = attrs[:RNTRC]
        # Previsao
        @date = attrs[:dPrev]
        # Lotacao
        @capacity = attrs[:lota]
        # Conta Frete
        @ciot = attrs[:CIOT]

        # Coletas
        if attrs[:occ]
          @collections = create_resources(Collection, attrs[:occ])
        end

        # Vales pedagios
        if attrs[:valePed]
          @tolls = create_resources(Toll, attrs[:valePed])
        end

        # Veiculo
        if attrs[:veic]
          @vehicle = Vehicle.new(attrs[:veic])
        end

        # Lacres
        if attrs[:lacRodo]
          @seals = to_array(attrs[:lacRodo])
        end

        if attrs[:moto]
          @drivers = create_resources(Person, attrs[:moto])
        end
      end
    end
  end
end