require File.expand_path("../../../test_helper", __FILE__)

describe CteReader::PreviousDocument do
  def cte_hash
    {
      emiDocAnt: {
        CNPJ: '58571647000153',
        CPF: '63123256952',
        IE: '1029384756',
        xNome: 'Person',
        UF: 'ST'
      },
      idDocAntEle: [
        { chave: '103810294982874239478913' },
        { chave: '108302189413121301202959' }
      ],
      idDocAntPap: [{ 
        tpDoc: '99',
        serie: '01',
        subser: '00',
        dEmi: '2000-02-01',
        nDoc: '1250'
      }]
    }
  end

  let(:document) { CteReader::PreviousDocument.new(cte_hash) }

  it '#emitter' do
    document.emitter.must_be_instance_of CteReader::Person
  end

  it '#documents' do
    document.documents.must_equal [['103810294982874239478913'], ['108302189413121301202959']]
  end

  it '#paper_documents' do
    document.paper_documents.must_be_instance_of Array
  end

  it '#paper_documents' do
    document.paper_documents.first.must_be_instance_of CteReader::PaperDocument
  end
end