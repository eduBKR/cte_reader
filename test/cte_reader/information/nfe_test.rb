require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Nfe do
  def cte_hash
    {
      chave: '100101902833404059607922349327532947543001',
      PIN: '2304765835',
      dPrev: '2000-02-01',
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

  let(:nfe) { Cte::Reader::Nfe.new(cte_hash) }

  it '#key' do
    nfe.key.must_equal cte_hash[:chave]
  end

  it '#pin' do
    nfe.pin.must_equal cte_hash[:PIN]
  end

  it '#date' do
    nfe.date.must_equal cte_hash[:dPrev]
  end

  it '#transport_units' do
    nfe.transport_units.must_be_instance_of Array
  end

  it '#transport_units' do
    nfe.transport_units.first.must_be_instance_of Cte::Reader::TransportUnit
  end

  it '#cargo_units' do
    nfe.cargo_units.must_be_instance_of Array
  end

  it '#cargo_units' do
    nfe.cargo_units.first.must_be_instance_of Cte::Reader::CargoUnit
  end
end