require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::TransportUnit do
  def cte_hash
    {
      tpUnidTransp: '00',
      idUnidTransp: '1000',
      lacUnidTransp: [
        { lacre: '1318238879-0' },
        { lacre: '5986072542-2' },
        { lacre: '6486762401-1' }
      ],
      infUnidCarga: [
        {
          tpUnidCarga: '13.408,87',
          idUnidCarga: 'Product',
          qtdRat: 'Other'
        }
      ]
    }
  end

  let(:transport) { Cte::Reader::TransportUnit.new(cte_hash) }

  it '#kind' do
    transport.kind.must_equal cte_hash[:tpUnidTransp]
  end

  it '#code' do
    transport.code.must_equal cte_hash[:idUnidTransp]
  end

  it '#seals' do
    transport.seals.must_equal [['1318238879-0'], ['5986072542-2'], ['6486762401-1']]
  end

  it '#cargo_units' do
    transport.cargo_units.must_be_instance_of Array
  end

  it '#cargo_units' do
    transport.cargo_units.first.must_be_instance_of Cte::Reader::CargoUnit
  end
end