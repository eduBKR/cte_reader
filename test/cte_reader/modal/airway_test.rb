require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::Airway do
  def cte_hash
    {
      nMinu: '32',
      nOCA: '100a0',
      dPrevAereo: '20000101',
      xLAgEmi: 'Emitter',
      IdT: '84659301826201',
      tarifa: {
        CL: '10',
        cTar: '1002',
        vTar: '130,54'
      },
      natCarga: {
        xDime: '120x340x200',
        cInfManu: 'Info',
        cIMP: '6753'
      }
    }
  end

  let(:airway) { CteReader::Airway.new(cte_hash) }

  it '#minuta' do
    airway.minuta.must_equal cte_hash[:nMinu]
  end

  it '#number' do
    airway.number.must_equal cte_hash[:nOCA]
  end

  it '#emitter' do
    airway.emitter.must_equal cte_hash[:xLAgEmi]
  end

  it '#emitter_id' do
    airway.emitter_id.must_equal cte_hash[:IdT]
  end

  it '#tax_class' do
    airway.tax_class.must_equal cte_hash[:tarifa][:CL]
  end

  it '#tax_code' do
    airway.tax_code.must_equal cte_hash[:tarifa][:cTar]
  end

  it '#tax_value' do
    airway.tax_value.must_equal cte_hash[:tarifa][:vTar]
  end

  it '#emitter_id' do
    airway.dimensions.must_equal cte_hash[:natCarga][:xDime]
  end

  it '#info' do
    airway.info.must_equal cte_hash[:natCarga][:cInfManu]
  end

  it '#imp' do
    airway.imp.must_equal cte_hash[:natCarga][:cIMP]
  end
end