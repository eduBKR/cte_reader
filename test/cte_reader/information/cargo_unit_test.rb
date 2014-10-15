require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::CargoUnit do
  def cte_hash
    {
      tpUnidCarga: '13.408,87',
      idUnidCarga: 'Product',
      qtdRat: 'Other',
      lacUnidCarga: [
        { lacre: '1318238879-0' },
        { lacre: '5986072542-2' },
        { lacre: '6486762401-1' }
      ]
    }
  end

  let(:cargo) { Cte::Reader::CargoUnit.new(cte_hash) }

  it '#kind' do
    cargo.kind.must_equal cte_hash[:tpUnidCarga]
  end

  it '#code' do
    cargo.code.must_equal cte_hash[:idUnidCarga]
  end

  it '#amount' do
    cargo.amount.must_equal cte_hash[:qtdRat]
  end

  it '#seals' do
    cargo.seals.must_equal [['1318238879-0'], ['5986072542-2'], ['6486762401-1']]
  end
end