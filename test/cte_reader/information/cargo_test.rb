require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Cargo do
  def cte_hash
    {
      vCarga: '13.408,87',
      proPred: 'Product',
      xOutCat: 'Other',
      infQ: [{
        qCarga: '230',
        tpMed: 'TONELADA',
        cUnid: '02'
      }]
    }
  end

  let(:cargo) { Cte::Reader::Cargo.new(cte_hash) }

  it '#total' do
    cargo.total.must_equal cte_hash[:vCarga]
  end

  it '#product' do
    cargo.product.must_equal cte_hash[:proPred]
  end

  it '#characteristics' do
    cargo.characteristics.must_equal cte_hash[:xOutCat]
  end

  it '#amounts' do
    cargo.amounts.must_be_instance_of Array
  end

  it '#amounts' do
    cargo.amounts.first.must_be_instance_of Cte::Reader::Amount
  end
end