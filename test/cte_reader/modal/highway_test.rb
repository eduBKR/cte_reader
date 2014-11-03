require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::Highway do
  def cte_hash
    {
      RNTRC: '512000153',
      dPrev: '2000101',
      lota: '4000',
      CIOT: '1267345376',
      occ: {
        serie: '1',
        nOcc: '1000',
        dEmi: '20000101'
      },
      valePed: {
        CNPJForn: '58571647000153',
        CNPJPg: '49342388000106',
        vValePed: '2450,00',
        nCompra: '330'
      },
      veic: {
        cInt: '1002',
        RENAVAM: '13213809',
        placa: 'ABC-123',
        tara: '300',
        capKG: '3000',
        capM3: '700',
        tpProp: 'P',
        tpRod: '01',
        tpCar: '02',
        UF: 'UF',
        prop: {
          CNPJ: '58571647000153',
          CPF: '63123256952',
          xNome: 'Person',
          UF: 'ST',
          RNTRC: '123812083',
          tpProp: '1'
        }
      },
      moto: {
        CPF: '63123256952',
        xNome: 'Person',
        UF: 'ST',
        RNTRC: '123812083',
        tpProp: '1'
      },
      lacRodo: [
        { lacre: '1318238879-0' },
        { lacre: '5986072542-2' },
        { lacre: '6486762401-1' }
      ]
    }
  end

  let(:highway) { CteReader::Highway.new(cte_hash) }

  it '#rntrc' do
    highway.rntrc.must_equal cte_hash[:RNTRC]
  end

  it '#date' do
    highway.date.must_equal cte_hash[:dPrev]
  end

  it '#capacity' do
    highway.capacity.must_equal cte_hash[:lota]
  end

  it '#ciot' do
    highway.ciot.must_equal cte_hash[:CIOT]
  end

  it '#vehicles' do
    highway.vehicles.first.must_be_instance_of CteReader::Vehicle
  end

  it '#collections' do
    highway.collections.first.must_be_instance_of CteReader::Collection
  end

  it '#tolls' do
    highway.tolls.first.must_be_instance_of CteReader::Toll
  end

  it '#drivers' do
    highway.drivers.first.must_be_instance_of CteReader::Person
  end

  it '#seals' do
    highway.seals.must_equal [['1318238879-0'], ['5986072542-2'], ['6486762401-1']]
  end
end