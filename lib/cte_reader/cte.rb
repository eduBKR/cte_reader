module CteReader
  class Cte
    include AttributeHelper
    include CreatorHelper

    attr_reader :error, :trace, :version, :version_schema, :protocol, :header,
      :signature, :complement, :emitter, :sender, :dispatcher, :receiver,
      :recipient, :tax, :information, :complementary_key, :cancellation_key,
      :cancellation_date, :authorizations, :service, :modal_version

    def initialize(attrs)
      if attrs[:cteProc]
        # Versao Schema
        @version_schema = attrs[:cteProc][:versao]
        # Assinatura
        @signature = attrs[:cteProc][:CTe][:Signature]

        if attrs[:cteProc][:protCTe]
          @protocol = Protocol.new(attrs[:cteProc][:protCTe])
        end

        attrs = attrs[:cteProc][:CTe][:infCte]
      else
        attrs = attrs[:CTe][:infCte]
      end

      # Versao do XML
      @version = attrs[:versao]
      # Chave do CTe
      @number = attrs[:Id]

      # Cabecalho
      @header = Header.new(attrs[:ide])
      
      if attrs[:compl]
        # Complemento
        @complement = Complement.new(attrs[:compl])
      end

      # Emitente
      @emitter = Emitter.new(attrs[:emit])
      # Remetente
      @sender = Sender.new(attrs[:rem])

      # Expedidor
      if attrs[:exped]
        dispatcher = Dispatcher.new(attrs[:exped])
      end

      # Recebedor
      if attrs[:receb]
        @receiver = Receiver.new(attrs[:receb])
      end

      # Destinatario
      @recipient = Recipient.new(attrs[:dest])
      # Servico
      @service = Service.new(attrs[:vPrest])
      # Impostos
      @tax = Tax.new(attrs[:imp])

      if attrs[:infCTeNorm]
        # Informacoes dos produtos transportados
        @information = Information.new(attrs[:infCTeNorm])
        
        if attrs[:infCTeNorm][:infModal]
          @modal_version = attrs[:infCTeNorm][:infModal][:versaoModal]
        end
      end

      if attrs[:infCteComp]
        @complementary_key = attrs[:infCteComp][:chave]
      end

      if attrs[:infCteAnu]
        @cancellation_key = attrs[:infCteAnu][:chCte]
        @cancellation_date = attrs[:infCteAnu][:dEmi]
      end

      if attrs[:autXML]
        @authorizations = create_resources(Authorization, attrs[:autXML])
      end

    rescue => exception
      @error = exception
      @trace = exception.backtrace
    end

    def cte?
      true
    end

    def lot?
      false
    end

    def error?
      !error.nil?
    end
  end
end