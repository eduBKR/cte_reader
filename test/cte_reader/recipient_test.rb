require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Recipient do
  def cte_hash
    {
      CNPJ: '58571647000153',
      IE: '1230984765',
      xNome: 'Recipient',
      fone: '55 5555-5555',
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
      },
      locEnt:{
        xLgr: 'Address 2',
        nro: '3333',
        xCpl: 'Suspendisse nec risus non velit.',
        xBairro: 'Neighborhood',
        cMun: '1002',
        xMun: 'City',
        CEP: '00000-000',
        UF: 'State',
        cPais: '1058',
        xPais: 'Brazil'
      }
    }
  end

  let(:recipient) { CteReader::Recipient.new(cte_hash) }

  it '#person' do
    recipient.person.must_be_instance_of CteReader::Person
  end

  it '#address' do
    recipient.address.must_be_instance_of CteReader::Address
  end

  it '#local' do
    recipient.local.must_be_instance_of CteReader::Address
  end
end