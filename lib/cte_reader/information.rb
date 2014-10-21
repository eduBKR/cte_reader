module Cte
  module Reader
    class Information
      include CreatorHelper

      attr_reader :cargo, :nfs, :nfes, :other_documents, :previous_documents, :insurances,
        :dangerous_products, :vehicles, :billings, :highway, :replacement,
        :airway, :waterway, :railway, :pipeline, :multimodal

      def initialize(attrs = {})
        if attrs[:infCarga]
          # Carga
          @cargo = Cargo.new(attrs[:infCarga])
        end

        if attrs[:infDoc]
          # Nota Fiscal
          if attrs[:infDoc][:NF]
            @nfs = create_resources(Nf, attrs[:infDoc][:NF])
          end

          # Nota Fiscal Eletronica
          if attrs[:infDoc][:NFe]
            @nfes = create_resources(Nfe, attrs[:infDoc][:NFe])
          end

          # Outros Documentos
          if attrs[:infDoc][:infOutros]
            @other_documents = create_resources(OtherDocument, attrs[:infDoc][:infOutros])
          end

          # Documentos Anteriores
          if attrs[:infDoc][:idDocAnt]
            @previous_documents = create_resources(PreviousDocument, attrs[:infDoc][:idDocAnt])
          end
        end

        # Seguro
        if attrs[:seg]
          @insurances = create_resources(Insurance, attrs[:seg])
        end

        # Produto Perigoso
        if attrs[:peri]
          @dangerous_products = create_resources(DangerousProduct, attrs[:peri])
        end

        # Veiculos
        if attrs[:peri]
          @vehicles = create_resources(Vehicle, attrs[:veicNovos])
        end

        # Cobrancas
        if attrs[:cobr]
          @billing = Billing.new(attrs[:cobr])
        end

        if attrs[:infCteSub]
          @replacement = Replacement.new(attrs[:infCteSub])
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