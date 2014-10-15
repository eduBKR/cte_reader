module Cte
  module Reader
    class PaperDocument
      include AttributeHelper

      attr_reader :kind, :serie, :subserie, :number,
        :date

      # == Fields Values
      #
      # tpDoc: 00 - CTRC;
      #        01 - CTAC;
      #        02 - ACT;
      #        03 - NF Modelo 7;
      #        04 - NF Modelo 27;
      #        05 - Conhecimento Aéreo Nacional;
      #        06 - CTMC;
      #        07 - ATRE;
      #        08 - DTA (Despacho de Transito Aduaneiro);
      #        09 - Conhecimento Aéreo Internacional;
      #        10 - Conhecimento - Carta de Porte Internacional;
      #        11 - Conhecimento Avulso;
      #        12 - TIF (Transporte Internacional Ferroviário);
      #        99 - outros
      #
      def initialize(attrs = {})
        # Tipo de Documento
        @kind = attrs[:tpDoc]
        @serie = attrs[:serie]
        @subserie = attrs[:subser]
        @number = attrs[:nDoc]
        @date = attrs[:dEmi]
      end
    end
  end
end