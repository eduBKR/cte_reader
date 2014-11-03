require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Receiver do
  def cte_hash
    {
      CNPJ: '58571647000153',
      IE: '1230984765',
      xNome: 'Receiver',
      fone: '55 5555-5555',
      enderReceb: {
        xLgr: 'Address',
        nro: '2222',
        xCpl: 'Curabitur rutrum massa ligula, ac',
        xBairro: 'Neighborhood',
        cMun: '1001',
        xMun: 'City',
        CEP: '00000-000',
        UF: 'State',
        cPais: '1058',
        xPais: 'Brazil'
      }
    }
  end

  let(:receiver) { CteReader::Receiver.new(cte_hash) }

  it '#person' do
    receiver.person.must_be_instance_of CteReader::Person
  end

  it '#address' do
    receiver.address.must_be_instance_of CteReader::Address
  end
end