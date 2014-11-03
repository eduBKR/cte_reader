require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Sender do
  def cte_hash
    {
      CNPJ: '58571647000153',
      IE: '6574839210',
      xNome: 'Sender',
      xFant: 'Fantasy',
      fone: '55 5555-5555',
      email: 'email@localhost.test',
      enderReme:{
        xLgr: 'Address',
        nro: 'Number',
        xCpl: 'Complement',
        xBairro: 'Neighborhood',
        cMun: '1001',
        xMun: 'City',
        CEP: '00000-000',
        UF: 'State',
        cPais: '1058',
        xPais: 'Brazil'
      },
      locColeta: {
        CNPJ: '91797004000106',
        CPF: '28113502254',
        xNome: 'Local Name',
        xLgr: 'Local Address',
        nro: 'Local Number',
        xCpl: 'Local Complement',
        xBairro: 'Local Neighborhood',
        cMun: '1002',
        xMun: 'City 2',
        UF: 'State 2'
      }
    }
  end

  let(:sender) { CteReader::Sender.new(cte_hash) }

  it '#person' do
    sender.person.must_be_instance_of CteReader::Person
  end

  it '#address' do
    sender.address.must_be_instance_of CteReader::Address
  end

  it '#local' do
    sender.local.must_be_instance_of CteReader::Address
  end
end