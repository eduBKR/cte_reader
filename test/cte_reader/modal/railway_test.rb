require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::Railway do
  def cte_hash
    {
      tpTraf: '3',
      fluxo: 'Flow',
      idTrem: '3984',
      vFrete: '280',
      trafMut: {
        respFat: '1',
        ferrEmi: '1'
      },
      ferroEnv: {
        CNPJ: '58571647000153',
        cInt: '10000',
        IE: '1029384756',
        xNome: '3300'
      },
      detVag: {
        nVag: '7000153',
        cap: '10000',
        tpVag: 'Wagon',
        pesoR: '3300',
        pesoBC: '1700'
      }
    }
  end

  let(:railway) { CteReader::Railway.new(cte_hash) }

  it '#kind' do
    railway.kind.must_equal cte_hash[:tpTraf]
  end

  it '#flow' do
    railway.flow.must_equal cte_hash[:fluxo]
  end

  it '#train' do
    railway.train.must_equal cte_hash[:idTrem]
  end

  it '#value' do
    railway.value.must_equal cte_hash[:vFrete]
  end

  it '#responsible' do
    railway.responsible.must_equal cte_hash[:trafMut][:respFat]
  end
  it '#railroad_emitter' do
    railway.railroad_emitter.must_equal cte_hash[:trafMut][:ferrEmi]
  end

  it '#railroads' do
    railway.railroads.first.must_be_instance_of CteReader::Railroad
  end

  it '#wagons' do
    railway.wagons.first.must_be_instance_of CteReader::Wagon
  end
end