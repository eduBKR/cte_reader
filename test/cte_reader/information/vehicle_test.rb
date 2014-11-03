require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::Vehicle do
  def cte_hash
    {
      chassi: '12BJH1238UJDA',
      cCor: '1000',
      xCor: 'Red',
      cMod: '9731',
      vUnit: '1000.00',
      vFrete: '3000.00',
      cInt: '1002',
      RENAVAM: '13213809',
      placa: 'ABC-123',
      tara: '300',
      capKG: '3000',
      capM3: '700',
      tpProp: 'P',
      tpRod: '01',
      tpCar: '02',
      UF: 'UF',
      prop: {
        CNPJ: '58571647000153',
        CPF: '63123256952',
        xNome: 'Person',
        UF: 'ST',
        RNTRC: '123812083',
        tpProp: '1'
      }
    }
  end

  let(:vehicle) { CteReader::Vehicle.new(cte_hash) }

  it '#chassi' do
    vehicle.chassi.must_equal cte_hash[:chassi]
  end

  it '#color' do
    vehicle.color.must_equal cte_hash[:cCor]
  end

  it '#color_name' do
    vehicle.color_name.must_equal cte_hash[:xCor]
  end

  it '#model' do
    vehicle.model.must_equal cte_hash[:cMod]
  end

  it '#value' do
    vehicle.value.must_equal cte_hash[:vUnit]
  end

  it '#freight' do
    vehicle.freight.must_equal cte_hash[:vFrete]
  end

  it '#state' do
    vehicle.state.must_equal cte_hash[:UF]
  end

  it '#code' do
    vehicle.code.must_equal cte_hash[:cInt]
  end

  it '#renavam' do
    vehicle.renavam.must_equal cte_hash[:RENAVAM]
  end

  it '#tara_pound' do
    vehicle.tara_pound.must_equal cte_hash[:tara]
  end

  it '#plate' do
    vehicle.plate.must_equal cte_hash[:placa]
  end

  it '#capacity_pound' do
    vehicle.capacity_pound.must_equal cte_hash[:capKG]
  end

  it '#capacity_meter' do
    vehicle.capacity_meter.must_equal cte_hash[:capM3]
  end

  it '#owner_kind' do
    vehicle.owner_kind.must_equal cte_hash[:tpProp]
  end

  it '#kind' do
    vehicle.kind.must_equal cte_hash[:tpVeic]
  end

  it '#wheel_kind' do
    vehicle.wheel_kind.must_equal cte_hash[:tpRod]
  end

  it '#body_kind' do
    vehicle.body_kind.must_equal cte_hash[:tpCar]
  end

  it '#owner' do
    vehicle.owner.must_be_instance_of CteReader::Person
  end
end