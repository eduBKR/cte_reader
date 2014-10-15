require File.expand_path("../../../test_helper", __FILE__)

describe Cte::Reader::Toll do
  def cte_hash
    {
      CNPJForn: '58571647000153',
      CNPJPg: '49342388000106',
      vValePed: '2450,00',
      nCompra: '330'
    }
  end

  let(:toll) { Cte::Reader::Toll.new(cte_hash) }

  it '#cnpj_supplier' do
    toll.cnpj_supplier.must_equal cte_hash[:CNPJForn]
  end

  it '#number' do
    toll.number.must_equal cte_hash[:nCompra]
  end

  it '#cnpj_paying' do
    toll.cnpj_paying.must_equal cte_hash[:CNPJPg]
  end

  it '#value' do
    toll.value.must_equal cte_hash[:vValePed]
  end
end