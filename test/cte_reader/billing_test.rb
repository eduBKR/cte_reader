require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Billing do
  def cte_hash
    {
      fat:{
        nFat: '1000',
        vOrig: '1500.00',
        vDesc: '0.00',
        vLiq: '1500.00'
      },
      dup: {
          nDup: '1',
          dVenc: '01/01/2000',
          vDup: '1500.00' 
      }
    }
  end

  let(:billing) { CteReader::Billing.new(cte_hash) }

  it '#number' do
    billing.number.must_equal cte_hash[:fat][:nFat]
  end

  it '#value' do
    billing.value.must_equal cte_hash[:fat][:vOrig]
  end

  it '#descont' do
    billing.descont.must_equal cte_hash[:fat][:vDesc]
  end

  it '#value_net' do
    billing.value_net.must_equal cte_hash[:fat][:vLiq]
  end

  it '#duplicates' do
    billing.duplicates.first.must_be_instance_of CteReader::Duplicate
  end
end