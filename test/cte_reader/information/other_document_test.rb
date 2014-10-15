require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::OtherDocument do
  def cte_hash
    {
      tpDoc: '99',
      descOutros: 'Other',
      dEmi: '2000-01-01',
      dPrev: '2000-02-01',
      vDocFisc: '32,00',
      infUnidTransp: [
        {
          tpUnidTransp: '1',
          idUnidTransp: '2003'
        }
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

  let(:document) { Cte::Reader::OtherDocument.new(cte_hash) }

  it '#kind' do
    document.kind.must_equal cte_hash[:tpDoc]
  end

  it '#description' do
    document.description.must_equal cte_hash[:descOutros]
  end

  it '#value' do
    document.value.must_equal cte_hash[:vDocFisc]
  end

  it '#date' do
    document.date.must_equal cte_hash[:dEmi]
  end

  it '#delivery_date' do
    document.delivery_date.must_equal cte_hash[:dPrev]
  end

  it '#transport_unit' do
    document.transport_unit.must_be_instance_of Array
  end

  it '#transport_unit' do
    document.transport_unit.first.must_be_instance_of Cte::Reader::TransportUnit
  end

  it '#cargo_unit' do
    document.cargo_unit.must_be_instance_of Array
  end

  it '#cargo_unit' do
    document.cargo_unit.first.must_be_instance_of Cte::Reader::CargoUnit
  end
end