require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::Wagon do
  def cte_hash
    {
      nVag: '7000153',
      cap: '10000',
      tpVag: 'Wagon',
      pesoR: '3300',
      pesoBC: '1700'
    }
  end

  let(:wagon) { CteReader::Wagon.new(cte_hash) }

  it '#capacity' do
    wagon.capacity.must_equal cte_hash[:cap]
  end

  it '#number' do
    wagon.number.must_equal cte_hash[:nVag]
  end

  it '#kind' do
    wagon.kind.must_equal cte_hash[:tpVag]
  end

  it '#actual_weight' do
    wagon.actual_weight.must_equal cte_hash[:pesoR]
  end

  it '#weight' do
    wagon.weight.must_equal cte_hash[:pesoBC]
  end
end