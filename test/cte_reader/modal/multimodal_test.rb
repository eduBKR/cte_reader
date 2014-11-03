require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::Multimodal do
  def cte_hash
    {
      cotm: '7365',
      negotiable: '0'
    }
  end

  let(:multimodal) { CteReader::Multimodal.new(cte_hash) }

  it '#cotm' do
    multimodal.cotm.must_equal cte_hash[:COTM]
  end

  it '#negotiable' do
    multimodal.negotiable.must_equal cte_hash[:indNegociavel]
  end
end