require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Amount do
  def cte_hash
    {
      qCarga: '230',
      tpMed: 'TONELADA',
      cUnid: '02'
    }
  end

  let(:amount) { Cte::Reader::Amount.new(cte_hash) }

  it '#amount' do
    amount.amount.must_equal cte_hash[:qCarga]
  end

  it '#kind' do
    amount.kind.must_equal cte_hash[:tpMed]
  end

  it '#unit' do
    amount.unit.must_equal cte_hash[:cUnid]
  end
end