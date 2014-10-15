require File.expand_path("../../test_helper", __FILE__)

describe Cte::Reader::Replacement do
  def cte_hash
    {
      chCte: '082134687252023014682731642803162143',
      tomaICMS: {
        refNFe: '1723948723947329874923749823749244',
        refNF: {
          CNPJ: '58571647000153',
          CPF: '63123256952',
          mod: '10',
          serie: '01',
          subserie: '02',
          nro: '1001',
          valor: '100,50',
          dEmi: '20000101'
        }
      },
      tomaNaoICMS: {
        refCteAnu: '8392374923749823797492734973294732947'
      }
    }
  end

  let(:receiver) { Cte::Reader::Replacement.new(cte_hash) }

  it '#key' do
    receiver.key.must_equal cte_hash[:chCte]
  end

  it '#nfe_key' do
    receiver.nfe_key.must_equal cte_hash[:tomaICMS][:refNFe]
  end

  it '#cnpj' do
    receiver.cnpj.must_equal cte_hash[:tomaICMS][:refNF][:CNPJ]
  end

  it '#cpf' do
    receiver.cpf.must_equal cte_hash[:tomaICMS][:refNF][:CPF]
  end

  it '#model' do
    receiver.model.must_equal cte_hash[:tomaICMS][:refNF][:mod]
  end

  it '#serie' do
    receiver.serie.must_equal cte_hash[:tomaICMS][:refNF][:serie]
  end

  it '#subserie' do
    receiver.subserie.must_equal cte_hash[:tomaICMS][:refNF][:subserie]
  end

  it '#number' do
    receiver.number.must_equal cte_hash[:tomaICMS][:refNF][:nro]
  end

  it '#value' do
    receiver.value.must_equal cte_hash[:tomaICMS][:refNF][:valor]
  end

  it '#date' do
    receiver.date.must_equal cte_hash[:tomaICMS][:refNF][:dEmi]
  end

  it '#cancellation' do
    receiver.cancellation.must_equal cte_hash[:tomaNaoICMS][:refCteAnu]
  end
end