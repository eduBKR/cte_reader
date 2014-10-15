module Cte
  module Reader
    class Cte
      include AttributeHelper
      include CreatorHelper

      attr_reader :error, :trace, :version, :version_schema, :key, :header,
        :signature, :complement, :emitter, :sender, :dispatcher, :receiver,
        :recipient, :tax, :information, :complementary_key, :cancellation_key,
        :cancellation_date, :authorizations, :service, :modal_version

      def initialize(file)
        xml = file.is_a?(Nokogiri::XML::Document) ? file : Nokogiri::XML(file)
        xml = xml.to_hash

        # Versao Schema
        @version_schema = xml[:cteProc][:versao]
        # Assinatura
        @signature = xml[:cteProc][:CTe][:Signature]

        xml = xml[:cteProc][:CTe][:infCte]

        # Versao do XML
        @version = xml[:versao]
        # Chave do CTe
        @key = xml[:Id]

        # Cabecalho
        @header = Header.new(xml[:ide])
        # Complemento
        @complement = Complement.new(xml[:compl])
        # Emitente
        @emitter = Emitter.new(xml[:emit])
        # Remetente
        @sender = Sender.new(xml[:rem])

        # Expedidor
        if xml[:exped]
          dispatcher = Dispatcher.new(xml[:exped])
        end

        # Recebedor
        if xml[:receb]
          @receiver = Receiver.new(xml[:receb])
        end

        # Destinatario
        @recipient = Recipient.new(xml[:dest])
        # Servico
        @service = Service.new(xml[:vPrest])
        # Impostos
        @tax = Tax.new(xml[:imp])
        # Informacoes dos produtos transportados
        @information = Information.new(xml[:infCTeNorm])

        if xml[:infCTeNorm][:infModal]
          @modal_version = xml[:infCTeNorm][:infModal][:versaoModal]
        end

        if xml[:infCteComp]
          @complementary_key = xml[:infCteComp][:chave]
        end

        if xml[:infCteAnu]
          @cancellation_key = xml[:infCteAnu][:chCte]
          @cancellation_date = xml[:infCteAnu][:dEmi]
        end

        if xml[:autXML]
          @authorizations = create_resources(Authorization, xml[:autXML])
        end

      rescue => exception
        @error = exception
        @trace = exception.backtrace
      ensure
        file.close if file.respond_to? :close
      end

      def error?
        !error.nil?
      end
    end
  end
end