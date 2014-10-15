require File.expand_path("../../test_helper", __FILE__)

describe Cte::Reader::Complement do
  def cte_hash
    {
      xCaracAd: 'REENTREGA;',
      xCaracSer: 'ENTREGA',
      xEmi: 'Employee',
      origCalc: 'City 1',
      destCalc: 'City 2',
      xObs: 'Integer ac tempor risus, eget.',
      ObsCont: {
        xCampo: 'Obs',
        sTexto: 'Vivamus tortor leo, hendrerit ut.'
      },
      ObsFisco: {
        xCampo: 'Obs',
        sTexto: 'Sed interdum leo quis lectus.'
      },
      fluxo:{
        xOrig: 'City',
        xDest: 'City 2',
        xRota: 'Route 66',
        pass: { xPass: 'City 3' }
      },
      Entrega: {
        semData: {
          tpPer: '0'
        },
        semHora: {
          tpHor: '0'
        }
      }
    }
  end

  def hash_with_date
    {
      Entrega: {
        comData: {
          tpPer: '1',
          dProg: '2000/01/01'
        },
        comHora: {
          tpHor: '1',
          hProg: '12:00:00'
        }
      }
    }
  end

  def hash_with_deadline
    {
      Entrega: {
        noPeriodo: {
          tpPer: '4',
          dIni: '2000/01/01',
          dFim: '2000/01/10'
        },
        noInter: {
          tpHor: '4',
          hIni: '12:00:00',
          hFim: '18:00:00'
        }
      }
    }
  end

  let(:complement) { Cte::Reader::Complement.new(cte_hash) }

  it '#transport_feature' do
    complement.transport_feature.must_equal cte_hash[:xCaracAd]
  end

  it '#service_feature' do
    complement.service_feature.must_equal cte_hash[:xCaracSer]
  end

  it '#employee' do
    complement.employee.must_equal cte_hash[:xEmi]
  end

  it '#city_start' do
    complement.city_start.must_equal cte_hash[:origCalc]
  end

  it '#city_end' do
    complement.city_end.must_equal cte_hash[:destCalc]
  end

  it '#observation' do
    complement.observation.must_equal cte_hash[:xObs]
  end

  it '#taxpayer_messages' do
    complement.taxpayer_messages.must_equal [["Obs", "Vivamus tortor leo, hendrerit ut."]]
  end

  it '#messages' do
    complement.messages.must_equal [["Obs", "Vivamus tortor leo, hendrerit ut."]]
  end

  it '#origin' do
    complement.origin.must_equal cte_hash[:fluxo][:xOrig]
  end

  it '#destination' do
    complement.destination.must_equal cte_hash[:fluxo][:xDest]
  end

  it '#route' do
    complement.route.must_equal cte_hash[:fluxo][:xRota]
  end

  it '#passage' do
    complement.passage.must_equal [["City 3"]]
  end

  it '#date_kind' do
    complement.date_kind.must_equal cte_hash[:Entrega][:semData][:tpPer]
  end

  it '#hour_kind' do
    complement.hour_kind.must_equal cte_hash[:Entrega][:semHora][:tpHor]
  end

  describe 'with data and hour' do
    let(:complement) { Cte::Reader::Complement.new(hash_with_date) }

    it '#date_kind' do
      complement.date_kind.must_equal hash_with_date[:Entrega][:comData][:tpPer]
    end

    it '#date' do
      complement.date.must_equal hash_with_date[:Entrega][:comData][:dProg]
    end

    it '#hour_kind' do
      complement.hour_kind.must_equal hash_with_date[:Entrega][:comHora][:tpHor]
    end

    it '#hour' do
      complement.hour.must_equal hash_with_date[:Entrega][:comHora][:hProg]
    end
  end

  describe 'with period and interval' do
    let(:complement) { Cte::Reader::Complement.new(hash_with_deadline) }

    it '#date_kind' do
      complement.date_kind.must_equal hash_with_deadline[:Entrega][:noPeriodo][:tpPer]
    end

    it '#date_start' do
      complement.date_start.must_equal hash_with_deadline[:Entrega][:noPeriodo][:dIni]
    end

    it '#date_end' do
      complement.date_end.must_equal hash_with_deadline[:Entrega][:noPeriodo][:dFim]
    end

    it '#hour_kind' do
      complement.hour_kind.must_equal hash_with_deadline[:Entrega][:noInter][:tpHor]
    end

    it '#hour_start' do
      complement.hour_start.must_equal hash_with_deadline[:Entrega][:noInter][:hIni]
    end

    it '#hour_end' do
      complement.hour_end.must_equal hash_with_deadline[:Entrega][:noInter][:hFim]
    end
  end
end