module CteReader
  class Header
    include AttributeHelper

    attr_reader :state_code, :cfop, :operation, :payment, :model,
      :serie, :number, :emission_date, :orientation, :emission_kind,
      :digit, :environment, :kind, :process, :version, :key, :city,
      :state, :modal, :service_kind, :city_code_start, 
      :city_name_start, :state_start, :city_code_end, :city_name_end,
      :state_end, :removal, :removal_description, :contingency_justification,
      :contingency_date, :taker, :taker_code, :code

    # == Fields Values
    #
    # forPag: 0 - Pago; 1-A pagar; 2-Outros
    #
    # tpImp: 1-Retrato; 2-Paisagem
    #
    # tpEmis: 1 - Normal;
    #         4 - EPEC pela SVC;
    #         5 - Contingência FSDA;
    #         7 - Autorização pela SVC-RS;
    #         8 - Autorização pela SVC-SP
    #
    # tpAmb: 1 - Produção; 2 - Homologação
    #
    # tpCTe: 0 - CT-e Normal;
    #        1 - CT-e de Complemento de Valores;
    #        2 - CT-e de Anulação;
    #        3 - CT-e Substituto
    #
    # procEmi: 0 - emissão de CT-e com aplicativo do contribuinte;
    #          1 - emissão de CT-e avulsa pelo Fisco;
    #          2 - emissão de CT-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco;
    #          3 - emissão CT-e pelo contribuinte com aplicativo fornecido pelo Fisco.
    #
    # modal: 01-Rodoviário; 
    #        02-Aéreo; 
    #        03-Aquaviário;
    #        04-Ferroviário;
    #        05-Dutoviário;
    #        tpServ06-Multimodal;
    #
    # tpServ: 0 - Normal;
    #         1 - Subcontratação;
    #         2 - Redespacho;
    #         3 - Redespacho Intermediário; 
    #         4 - Serviço Vinculado a Multimodal
    #
    # retira: 0 - sim; 1 - não
    #
    # toma: 0-Remetente;
    #       1-Expedidor;
    #       2-Recebedor;
    #       3-Destinatário
    #       4-Outros

    def initialize(attrs = {})
      # Codigo da UF do emitente do CT-e.
      @state_code = attrs[:cUF]
      # Código numerico que compoe a Chave de Acesso
      @code = attrs[:cCT]
      # CFOP
      @cfop = attrs[:CFOP]
      # Natureza de Operacao
      @operation = attrs[:natOp]
      # Forma de Pagamento
      @payment = attrs[:forPag]
      # Modelo
      @model = attrs[:mod]
      # Serie
      @serie = attrs[:serie]
      # Numero
      @number = attrs[:nCT]
      # Data de Emissao
      @emission_date = attrs[:dhEmi]
      # Orientação da Pagina
      @orientation = attrs[:tpImp]
      # Tipo de Emissao
      @emission_kind = attrs[:tpEmis]
      # Digito Verificador
      @digit = attrs[:cDV]
      # Ambiente
      @environment = attrs[:tpAmb]
      # Tipo de CTe
      @kind = attrs[:tpCTe]
      # Processo de Emissao
      @process = attrs[:procEmi]
      # Versao
      @version = attrs[:verProc]
      # Chave de acesso do CT-e referenciado
      @key = attrs[:refCTE]
      # Municipio
      @city = attrs[:xMunEnv]
      # Estado
      @state = attrs[:UFEnv]
      # Modal
      @modal = attrs[:modal]
      # Tipo do Servico
      @service_kind = attrs[:tpServ]
      # Codigo da cidade de inicido do transporte
      @city_code_start = attrs[:cMunIni]
      # Nome da Cidade de inicio do transporte
      @city_name_start = attrs[:xMunIni]
      # Estado de inicio do transporte
      @state_start = attrs[:UFIni]
      # Codigo da cidade de destino do transporte
      @city_code_end = attrs[:cMunFim]
      # Nome da cidade de destino do transporte
      @city_name_end = attrs[:xMunFim]
      # Estado de destino do transporte
      @state_end = attrs[:UFFim]
      # Retirada
      @removal = attrs[:retira]
      # Detalhes da Retirada
      @removal_description = attrs[:xDetRetira]
      
      # Contigencia
      @contingency_date = attrs[:dhCont]
      @contingency_justification = attrs[:xJust]

      if attrs[:toma03]
        # Tipo Tomador do Servico
        @taker_code = attrs[:toma03][:toma]
      end

      if attrs[:toma4]
        # Tipo Tomador do Servico
        @taker_code = attrs[:toma4][:toma]
        # Tomador do Servico
        @taker = Taker.new(attrs[:toma4])
      end
    end
  end
end