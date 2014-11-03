module CteReader
  class Person
    include AttributeHelper

    attr_reader :cnpj, :cpf, :state_registration,
      :name, :phone, :suframa, :email, :fantasy,
      :state, :rntrc, :owner_kind

    def initialize(attrs = {})
      # CNPJ
      @cnpj = attrs[:CNPJ]
      # CPF
      @cpf = attrs[:CPF]
      # Inscricao Estadual
      @state_registration = attrs[:IE]
      # Nome
      @name = attrs[:xNome]
      # Fantasia Empresa
      @fantasy = attrs[:xFant]
      # Telefone
      @phone = attrs[:fone]
      # Incricao Suframa
      @suframa = attrs[:ISUF]
      # Email
      @email = attrs[:email]
      # Estado
      @state = attrs[:UF]

      # Proprietario do Veiculo
      @rntrc = attrs[:RNTRC]
      @owner_kind = attrs[:tpProp]
    end
  end
end