require File.expand_path("../../test_helper", __FILE__)

describe Cte::Reader::Header do
  def cte_hash
    {
      cUF: 'ES',
      cCT: '1000',
      CFOP: '0000',
      natOp: '1',
      forPag: '0',
      mod: '57',
      serie:' 0',
      nCT: '1234567890',
      dhEmi: '2000/01/01',
      tpImp: '1',
      tpEmis: '1',
      cDV: '01',
      tpAmb: '1',
      tpCTe: '0',
      procEmi: '0',
      verProc: '2.0',
      refCTE: '0000',
      xMunEnv: 'City',
      UFEnv: 'UF',
      modal: '9',
      tpServ: '0',
      cMunIni: '1001',
      xMunIni: 'City 1',
      UFIni: 'UF',
      cMunFim: '1002',
      xMunFim: 'City 2',
      UFFim: 'ES',
      retira: '0',
      xDetRetira: 'Lorem Ipsum',
      dhCont: '2000/01/01',
      xJust: 'Phasellus facilisis libero sit amet.',
      toma03: {
        toma: '0',
      }
    }
  end

  let(:header) { Cte::Reader::Header.new(cte_hash) }

  it '#state_code' do
    header.state_code.must_equal cte_hash[:cUF]
  end

  it '#code' do
    header.code.must_equal cte_hash[:cCT]
  end

  it '#cfop' do
    header.cfop.must_equal cte_hash[:CFOP]
  end

  it '#operation' do
    header.operation.must_equal cte_hash[:natOp]
  end

  it '#payment' do
    header.payment.must_equal cte_hash[:forPag]
  end

  it '#model' do
    header.model.must_equal cte_hash[:mod]
  end

  it '#serie' do
    header.serie.must_equal cte_hash[:serie]
  end

  it '#number' do
    header.number.must_equal cte_hash[:nCT]
  end

  it '#emission' do
    header.emission.must_equal cte_hash[:dhEmi]
  end

  it '#orientation' do
    header.orientation.must_equal cte_hash[:tpImp]
  end

  it '#emission_kind' do
    header.emission_kind.must_equal cte_hash[:tpEmis]
  end

  it '#digit' do
    header.digit.must_equal cte_hash[:cDV]
  end

  it '#environment' do
    header.environment.must_equal cte_hash[:tpAmb]
  end

  it '#kind' do
    header.kind.must_equal cte_hash[:tpCTe]
  end

  it '#process' do
    header.process.must_equal cte_hash[:procEmi]
  end

  it '#version' do
    header.version.must_equal cte_hash[:verProc]
  end

  it '#key' do
    header.key.must_equal cte_hash[:refCTE]
  end

  it '#city' do
    header.city.must_equal cte_hash[:xMunEnv]
  end

  it '#state' do
    header.state.must_equal cte_hash[:UFEnv]
  end

  it '#modal' do
    header.modal.must_equal cte_hash[:modal]
  end

  it '#service_kind' do
    header.service_kind.must_equal cte_hash[:tpServ]
  end

  it '#city_code_start' do
    header.city_code_start.must_equal cte_hash[:cMunIni]
  end

  it '#city_start' do
    header.city_start.must_equal cte_hash[:xMunIni]
  end

  it '#state_start' do
    header.state_start.must_equal cte_hash[:UFIni]
  end

  it '#city_code_end' do
    header.city_code_end.must_equal cte_hash[:cMunFim]
  end

  it '#city_name_end' do
    header.city_name_end.must_equal cte_hash[:xMunFim]
  end

  it '#state_end' do
    header.state_end.must_equal cte_hash[:UFFim]
  end

  it '#removal' do
    header.removal.must_equal cte_hash[:retira]
  end

  it '#removal_description' do
    header.removal_description.must_equal cte_hash[:xDetRetira]
  end

  it '#contingency_date' do
    header.contingency_date.must_equal cte_hash[:dhCont]
  end

  it '#contingency_justification' do
    header.contingency_justification.must_equal cte_hash[:xJust]
  end

  it '#taker_code' do
    header.taker_code.must_equal cte_hash[:toma03][:toma]
  end
end