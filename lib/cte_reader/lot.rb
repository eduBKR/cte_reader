module CteReader
  class Lot
    include AttributeHelper
    include CreatorHelper

    attr_reader :version, :lot_version, :number, :ctes,
      :protocol

    def initialize(attrs)
      if attrs[:cteProc]
        @version = attrs[:cteProc][:versao]

        attrs = attrs[:cteProc][:enviCTe]
      else
        attrs = attrs[:enviCTe]
      end

      @lot_version = attrs[:versao]
      @number = attrs[:idLote]

      @ctes = create_resources(Cte, attrs)

      if attrs[:protCTe]
        @protocol = Protocol.new(attrs[:protCTe])
      end
    end

    def cte?
      false
    end

    def lot?
      true
    end
  end
end