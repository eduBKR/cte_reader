require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Tax do
  def cte_hash
    {
      ICMS: {
        ICMS00: {
          CST: '00',
          vBC: '1000.00',
          pICMS: '13.00',
          vICMS: '130.00',
          pRedBC: '10.3',
          vBCSTRet: '21.99',
          vICMSSTRet: '122.00',
          pICMSSTRet: '9.87',
          vCred: '12.00',
          pRedBCOutraUF: '14,20',
          vBCOutraUF: '100.32',
          pICMSOutraUF: '17.54',
          vICMSOutraUF: '210.56',
          indSN: '0'
        }
      },
      vTotTrib: '1200.00',
      infAdFisco: 'In sapien lorem, hendrerit in metus eget, bibendum sagittis ante.'
    }
  end

  let(:tax) { CteReader::Tax.new(cte_hash) }

  it '#icms' do
    tax.icms.must_be_instance_of Array
  end

  it '#icms' do
    tax.icms.first.must_be_instance_of CteReader::Icms
  end

  it '#total' do
    tax.total.must_equal cte_hash[:vTotTrib]
  end

  it '#info' do
    tax.info.must_equal cte_hash[:infAdFisco]
  end
end