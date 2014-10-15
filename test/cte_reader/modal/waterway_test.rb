require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Waterway do
  def cte_hash
    {
      vPrest: '150,49',
      vAFRMM: '300,99',
      nBooking: '450',
      nCtrl: '10340',
      xNavio: 'Ship 007',
      nViag: '3908',
      direc: 'N',
      prtEmb: 'Port 006',
      prtTrans: 'Port 005',
      prtDest: 'Port 001',
      tpNav: '1',
      irin: '73295',
      balsa: [
        {xBalsa: 'Ferry-01'},
        {xBalsa: 'Ferry-02'}
      ]
    }
  end

  let(:waterway) { Cte::Reader::Waterway.new(cte_hash) }

  it '#value' do
    waterway.value.must_equal cte_hash[:vPrest]
  end

  it '#afrmm' do
    waterway.afrmm.must_equal cte_hash[:vAFRMM]
  end

  it '#booking' do
    waterway.booking.must_equal cte_hash[:nBooking]
  end

  it '#number' do
    waterway.number.must_equal cte_hash[:nCtrl]
  end

  it '#ship' do
    waterway.ship.must_equal cte_hash[:xNavio]
  end

  it '#travel_number' do
    waterway.travel_number.must_equal cte_hash[:nViag]
  end

  it '#direction' do
    waterway.direction.must_equal cte_hash[:direc]
  end

  it '#embarkation' do
    waterway.embarkation.must_equal cte_hash[:prtEmb]
  end

  it '#transshipment' do
    waterway.transshipment.must_equal cte_hash[:prtTrans]
  end

  it '#destiny' do
    waterway.destiny.must_equal cte_hash[:prtDest]
  end

  it '#ship_kind' do
    waterway.ship_kind.must_equal cte_hash[:tpNav]
  end

  it '#irin' do
    waterway.irin.must_equal cte_hash[:irin]
  end

  it '#ferry' do
    waterway.ferry.must_equal [['Ferry-01'], ['Ferry-02']]
  end
end