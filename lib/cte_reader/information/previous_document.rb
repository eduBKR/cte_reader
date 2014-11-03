module CteReader
  class PreviousDocument
    include CreatorHelper

    attr_reader :emitter, :documents, :paper_documents

    def initialize(attrs = {})
      # Emitente
      if attrs[:emiDocAnt]
        @emitter = Person.new(attrs[:emiDocAnt])
      end

      # Documentos Eletronicos
      if attrs[:idDocAntEle]
        @documents = to_array(attrs[:idDocAntEle])
      end

      # Documentos em Papel
      if attrs[:idDocAntPap]
        @paper_documents = create_resources(PaperDocument, attrs[:idDocAntPap])
      end
    end
  end
end