require File.expand_path("../../test_helper", __FILE__)

describe Cte::Reader::Recipient do
  def cte_hash
    {
      CNPJ: '58571647000153',
      IE: '1230984765',
      xNome: 'Recipient',
      fone: '55 5555-5555',
      locEnt: 'Local',
      enderDest: {
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

  let(:recipient) { Cte::Reader::Recipient.new(cte_hash) }

  it '#person' do
    recipient.person.must_be_instance_of Cte::Reader::Person
  end

  it '#address' do
    recipient.address.must_be_instance_of Cte::Reader::Address
  end

  it '#local' do
    recipient.local.must_equal cte_hash[:locEnt]
  end
end