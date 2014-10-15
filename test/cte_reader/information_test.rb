require File.expand_path("../../test_helper", __FILE__)

describe Cte::Reader::Information do
  def cte_hash
    {
      infCarga: {
        vCarga: '13.408,87',
        proPred: 'Product',
        xOutCat: 'Other'
      },
      infDoc: {
        NF: [{
          nRoma: '138943579',
          nPed: '1000234',
          mod: '20',
          serie: '1',
          nDoc: '1230491',
          dEmi: '2000-01-01',
          vBC: '200,32',
          vICMS: '102,00',
          vBCST: '100,00',
          vST: '12,00',
          vProd: '500,45',
          vNF: '650,38',
          nCFOP: '0101',
          nPeso: '32,00',
          PIN: '2304765835',
          dPrev: '2000-02-01'
        }],
        NFe: [{
          chave: '100101902833404059607922349327532947543001',
          PIN: '2304765835',
          dPrev: '2000-02-01'
        }],
        infOutros: [{
          tpDoc: '99',
          descOutros: 'Other',
          dEmi: '2000-01-01',
          dPrev: '2000-02-01',
          vDocFisc: '32,00'
        }]
      }
    }
  end

  let(:information) { Cte::Reader::Information.new(cte_hash) }

  it '#cargo' do
    information.cargo.must_be_instance_of Cte::Reader::Cargo
  end

  it '#nf' do
    information.nf.first.must_be_instance_of Cte::Reader::Nf
  end

  it '#nfe' do
    information.nfe.first.must_be_instance_of Cte::Reader::Nfe
  end

  it '#other' do
    information.other.first.must_be_instance_of Cte::Reader::OtherDocument
  end
end