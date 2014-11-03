require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Emitter do
  def cte_hash
    {
      CNPJ: '58571647000153',
      IE: '1230984765',
      xNome: 'Emitter',
      xFant: 'Fantasy',
      enderEmit: {
        xLgr: 'Address',
        nro: '2222',
        xCpl: 'Curabitur rutrum massa ligula, ac',
        xBairro: 'Neighborhood',
        cMun: '1001',
        xMun: 'City',
        CEP: '00000-000',
        UF: 'State',
        fone: '55 5555-5555',
      }
    }
  end

  let(:emmitter) { CteReader::Emitter.new(cte_hash) }

  it '#person' do
    emmitter.person.must_be_instance_of CteReader::Person
  end

  it '#address' do
    emmitter.address.must_be_instance_of CteReader::Address
  end
end