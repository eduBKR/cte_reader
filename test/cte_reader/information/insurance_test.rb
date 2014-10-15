require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Insurance do
  def cte_hash
    {
      respSeg: 'Lorem Ipsum',
      xSeg: 'insurer',
      nApol: '1046803',
      nAver: '864252-1',
      vCarga: '2.000,00'
    }
  end

  let(:insurance) { Cte::Reader::Insurance.new(cte_hash) }

  it '#responsible' do
    insurance.responsible.must_equal cte_hash[:respSeg]
  end

  it '#insurer' do
    insurance.insurer.must_equal cte_hash[:xSeg]
  end

  it '#policy' do
    insurance.policy.must_equal cte_hash[:nApol]
  end

  it '#registration' do
    insurance.registration.must_equal cte_hash[:nAver]
  end

  it '#value' do
    insurance.value.must_equal cte_hash[:vCarga]
  end
end