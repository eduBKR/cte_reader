module Cte
  module Reader
    class Information
      include CreatorHelper

      attr_reader :cargo, :nf, :nfe, :other, :previous, :insurance,
        :dangerous_product, :vehicle, :billing, :highway, :replacement,
        :airway, :waterway, :railway, :pipeline, :multimodal

      def initialize(attrs = {})
        if attrs[:infCarga]
          # Carga
          @cargo = Cargo.new(attrs[:infCarga])
        end

        if attrs[:infDoc]
          # Nota Fiscal
          if attrs[:infDoc][:NF]
            @nf = create_resources(Nf, attrs[:infDoc][:NF])
          end

          # Nota Fiscal Eletronica
          if attrs[:infDoc][:NFe]
            @nfe = create_resources(Nfe, attrs[:infDoc][:NFe])
          end

          # Outros Documentos
          if attrs[:infDoc][:infOutros]
            @other = create_resources(OtherDocument, attrs[:infDoc][:infOutros])
          end

          # Documentos Anteriores
          if attrs[:infDoc][:idDocAnt]
            @previous = create_resources(PreviousDocument, attrs[:infDoc][:idDocAnt])
          end
        end

        # Seguro
        if attrs[:seg]
          @insurance = create_resources(Insurance, attrs[:seg])
        end

        # Produto Perigoso
        if attrs[:peri]
          @dangerous_product = create_resources(DangerousProduct, xml[:peri])
        end

        # Veiculos
        if attrs[:peri]
          @vehicle = create_resources(Vehicle, xml[:veicNovos])
        end

        # Cobrancas
        if attrs[:cobr]
          @billing = create_resources(Billing, xml[:cobr])
        end

        if attrs[:infCteSub]
          @replacement = create_resource(Replacement, attrs[:infCteSub])
        end

        # Modal
        if attrs[:infModal]
          if attrs[:infModal][:rodo]
            @highway = Highway.new(attrs[:infModal][:rodo])
          elsif attrs[:infModal][:aereo]
            @airway = Airway.new(attrs[:infModal][:aereo])
          elsif attrs[:infModal][:aquav]
            @waterway = Waterway.new(attrs[:infModal][:aquav])
          elsif attrs[:infModal][:ferrov]
            @railway = Railway.new(attrs[:infModal][:ferrov])
          elsif attrs[:infModal][:duto]
            @pipeline = Pipeline.new(attrs[:infModal][:duto])
          elsif attrs[:infModal][:multimodal]
            @multimodal = Multimodal.new(attrs[:infModal][:multimodal])
          end
        end
      end
    end
  end
end