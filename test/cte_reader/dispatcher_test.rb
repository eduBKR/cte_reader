require File.expand_path("../../test_helper", __FILE__)

describe Cte::Reader::Dispatcher do
  def cte_hash
    {
      CNPJ: '58571647000153',
      CPF: '28113502254',
      IE: '6574839210',
      xNome: 'Sender',
      fone: '55 5555-5555',
      email: 'email@localhost.test',
      enderExped:{
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
      }
    }
  end

  let(:dispatcher) { Cte::Reader::Dispatcher.new(cte_hash) }

  it '#person' do
    dispatcher.person.must_be_instance_of Cte::Reader::Person
  end

  it '#address' do
    dispatcher.address.must_be_instance_of Cte::Reader::Address
  end
end