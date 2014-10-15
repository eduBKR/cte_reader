require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Nf do
  def cte_hash
    {
      nRoma: '138943579',
      nPed: '1000234',
      mod: '20',
      serie: '1',
      nDoc: '1230491',
      dEmi: '2000-01-01',
      vBC: '200,32',
      vICMS: '102,00',
      vBCST: '100,00',
      vST: '12,00',
      vProd: '500,45',
      vNF: '650,38',
      nCFOP: '0101',
      nPeso: '32,00',
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

  let(:nf) { Cte::Reader::Nf.new(cte_hash) }

  it '#romaneio' do
    nf.romaneio.must_equal cte_hash[:nRoma]
  end

  it '#request_number' do
    nf.request_number.must_equal cte_hash[:nPed]
  end

  it '#model' do
    nf.model.must_equal cte_hash[:mod]
  end

  it '#serie' do
    nf.serie.must_equal cte_hash[:serie]
  end

  it '#number' do
    nf.number.must_equal cte_hash[:nDoc]
  end

  it '#date' do
    nf.date.must_equal cte_hash[:dEmi]
  end

  it '#icms_base' do
    nf.icms_base.must_equal cte_hash[:vBC]
  end

  it '#icms' do
    nf.icms.must_equal cte_hash[:vICMS]
  end

  it '#icms_st_base' do
    nf.icms_st_base.must_equal cte_hash[:vBCST]
  end

  it '#icms_st' do
    nf.icms_st.must_equal cte_hash[:vST]
  end

  it '#product_value' do
    nf.product_value.must_equal cte_hash[:vProd]
  end

  it '#total' do
    nf.total.must_equal cte_hash[:vNF]
  end

  it '#cfop' do
    nf.cfop.must_equal cte_hash[:nCFOP]
  end

  it '#weight' do
    nf.weight.must_equal cte_hash[:nPeso]
  end

  it '#pin' do
    nf.pin.must_equal cte_hash[:PIN]
  end

  it '#delivery_date' do
    nf.delivery_date.must_equal cte_hash[:dPrev]
  end

  it '#transport_unit' do
    nf.transport_unit.must_be_instance_of Array
  end

  it '#transport_unit' do
    nf.transport_unit.first.must_be_instance_of Cte::Reader::TransportUnit
  end

  it '#cargo_unit' do
    nf.cargo_unit.must_be_instance_of Array
  end

  it '#cargo_unit' do
    nf.cargo_unit.first.must_be_instance_of Cte::Reader::CargoUnit
  end
end