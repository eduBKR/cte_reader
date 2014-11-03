require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Authorization do
  def cte_hash
    {
      CNPJ: '99819146000120',
      CPF: '64046757655'
    }
  end

  let(:authorization) { CteReader::Authorization.new(cte_hash) }

  it '#cnpj' do
    authorization.cnpj.must_equal cte_hash[:CNPJ]
  end
  
  it '#cpf' do
    authorization.cpf.must_equal cte_hash[:CPF]
  end
end