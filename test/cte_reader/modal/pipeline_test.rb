require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Pipeline do
  def cte_hash
    {
      vTar: '3045,80',
      dIni: '20000101',
      dFim: '20000102'
    }
  end

  let(:pipeline) { Cte::Reader::Pipeline.new(cte_hash) }

  it '#value' do
    pipeline.value.must_equal cte_hash[:vTar]
  end

  it '#date_start' do
    pipeline.date_start.must_equal cte_hash[:dIni]
  end

  it '#date_end' do
    pipeline.date_end.must_equal cte_hash[:dFim]
  end
end