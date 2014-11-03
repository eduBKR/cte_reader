module CteReader
  class Protocol
    include AttributeHelper

    attr_reader :enviroment, :version_app, :key, :date,
      :number, :digest, :status, :description, :cte_id

    def initialize(attrs = {})
      attrs = attrs[:protCTe] ? attrs[:protCTe] : attrs

      if attrs[:infProt]
        # Id
        @cte_id = attrs[:infProt][:Id]
        # Ambiente
        @enviroment = attrs[:infProt][:tpAmb]
        # Versao do App Emissor
        @version_app = attrs[:infProt][:verAplic]
        # Chave
        @key = attrs[:infProt][:chCTe]
        # Data
        @date = attrs[:infProt][:dhRecbto]
        # Protocolo
        @number = attrs[:infProt][:nProt]
        # Digest
        @digest = attrs[:infProt][:digVal]
        # Status
        @status = attrs[:infProt][:cStat]
        # Descricao
        @description = attrs[:infProt][:xMotivo]
      end
    end
  end
end