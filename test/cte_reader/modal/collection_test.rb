require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::Collection do
  def cte_hash
    {
      serie: '1',
      nOcc: '1000',
      dEmi: '20000101',
      emiOcc: {
        cInt: '10021',
        CNPJ: '58571647000153',
        IE: '1029384756',
        xNome: 'Person',
      }
    }
  end

  let(:collection) { CteReader::Collection.new(cte_hash) }

  it '#serie' do
    collection.serie.must_equal cte_hash[:serie]
  end

  it '#number' do
    collection.number.must_equal cte_hash[:nOcc]
  end

  it '#date' do
    collection.date.must_equal cte_hash[:dEmi]
  end

  it '#code' do
    collection.code.must_equal cte_hash[:cInt]
  end

  it '#emitter' do
    collection.emitter.must_be_instance_of CteReader::Person
  end
end