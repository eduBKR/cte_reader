require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::Railroad do
  def cte_hash
    {
      CNPJ: '58571647000153',
      cInt: '10000',
      IE: '1029384756',
      xNome: '3300',
      enderFerro: {
        CNPJ: '58571647000153',
        xBairro: 'Neighborhood',
        cMun: '1001',
        xMun: 'City',
        CEP: '00000-000',
        UF: 'State'
      }
    }
  end

  let(:railroad) { CteReader::Railroad.new(cte_hash) }

  it '#cnpj' do
    railroad.cnpj.must_equal cte_hash[:CNPJ]
  end

  it '#code' do
    railroad.code.must_equal cte_hash[:cInt]
  end

  it '#state_registration' do
    railroad.state_registration.must_equal cte_hash[:IE]
  end

  it '#name' do
    railroad.name.must_equal cte_hash[:xNome]
  end

  it '#address' do
    railroad.address.must_be_instance_of CteReader::Address
  end
end