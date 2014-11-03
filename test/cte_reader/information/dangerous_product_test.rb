require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::DangerousProduct do
  def cte_hash
    {
      nONU: '867031',
      xNomeAE: 'Dangerous Product',
      xClaRisco: '10',
      grEmb: '50',
      qTotProd: '4000',
      qVolTipo: '2000',
      pontoFulgor: '300'
    }
  end

  let(:product) { CteReader::DangerousProduct.new(cte_hash) }

  it '#onu_number' do
    product.onu_number.must_equal cte_hash[:nONU]
  end

  it '#transport' do
    product.transport.must_equal cte_hash[:xNomeAE]
  end

  it '#risk_class' do
    product.risk_class.must_equal cte_hash[:xClaRisco]
  end

  it '#packing' do
    product.packing.must_equal cte_hash[:grEmb]
  end

  it '#total' do
    product.total.must_equal cte_hash[:qVolTipo]
  end

  it '#amount' do
    product.amount.must_equal cte_hash[:qTotProd]
  end

  it '#flashpoint' do
    product.flashpoint.must_equal cte_hash[:pontoFulgor]
  end
end