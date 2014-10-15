require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::PaperDocument do
  def cte_hash
    {
      tpDoc: '99',
      serie: '01',
      subser: '00',
      dEmi: '2000-02-01',
      nDoc: '1250'
    }
  end

  let(:document) { Cte::Reader::PaperDocument.new(cte_hash) }

  it '#kind' do
    document.kind.must_equal cte_hash[:tpDoc]
  end

  it '#serie' do
    document.serie.must_equal cte_hash[:serie]
  end

  it '#subserie' do
    document.subserie.must_equal cte_hash[:subser]
  end

  it '#number' do
    document.number.must_equal cte_hash[:nDoc]
  end

  it '#date' do
    document.date.must_equal cte_hash[:dEmi]
  end
end