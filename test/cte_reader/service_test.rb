require File.expand_path("../../test_helper", __FILE__)

describe Cte::Reader::Service do
  def cte_hash
    {
     vTPrest: '1000.00',
     vRec: '1200.00',
     Comp: [
      { xNome: 'FRETE VALOR', vComp: '500.00' },
      { xNome: 'FRETE PESO', vComp: '500.00' },
      { xNome: 'ADEME', vComp: '200.00' }
     ]
    }
  end

  let(:service) { Cte::Reader::Service.new(cte_hash) }

  it '#total' do
    service.total.must_equal cte_hash[:vTPrest]
  end

  it '#value' do
    service.value.must_equal cte_hash[:vRec]
  end

  it '#components' do
    service.components.must_equal [['FRETE VALOR', '500.00'], ['FRETE PESO', '500.00'], ['ADEME', '200.00']]
  end
end