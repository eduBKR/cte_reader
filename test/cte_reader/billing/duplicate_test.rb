require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Duplicate do
  def cte_hash
    {
      nDup: '1',
      dVenc: '01/01/2000',
      vDup: '50.00'
    }
  end

  let(:duplicate) { Cte::Reader::Duplicate.new(cte_hash) }

  it '#number' do
    duplicate.number.must_equal cte_hash[:nDup]
  end

  it '#expiration' do
    duplicate.expiration.must_equal cte_hash[:dVenc]
  end

  it '#value' do
    duplicate.value.must_equal cte_hash[:vDup]
  end
end
