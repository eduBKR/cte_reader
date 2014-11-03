require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Taker do
  def cte_hash
    {
      CNPJ: '58571647000153',
      CPF: '63123256952',
      IE: '1029384756',
      xNome: 'Taker',
      xFant: 'Fantasy',
      fone: '55 5555-5555',
      email: 'email@localhost',
      enderToma: {
        xLgr: 'Street',
        nro: '123',
        xCpl: 'Donec at congue lectus, id.',
        xBairro: 'Neighborhood',
        cMun: '1000',
        xMun: 'City',
        CEP: '00000-000',
        UF: 'UF',
        cPais: '1058',
        xPais: 'Brasil'
      }
    }
  end

  let(:taker) { CteReader::Taker.new(cte_hash) }

  it '#person' do
    taker.person.must_be_instance_of CteReader::Person
  end

  it '#address' do
    taker.address.must_be_instance_of CteReader::Address
  end
end