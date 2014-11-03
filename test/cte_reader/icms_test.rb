require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Icms do
  def cte_hash
    {
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
  end

  let(:tax) { CteReader::Icms.new(cte_hash) }

  it '#cst' do
    tax.cst.must_equal cte_hash[:CST]
  end

  it '#icms_base' do
    tax.icms_base.must_equal cte_hash[:vBC]
  end

  it '#icms_percentage' do
    tax.icms_percentage.must_equal cte_hash[:pICMS]
  end

  it '#icms_base_reduction' do
    tax.icms_base_reduction.must_equal cte_hash[:pRedBC]
  end

  it '#icms_st_base_retained_sender' do
    tax.icms_st_base_retained_sender.must_equal cte_hash[:vBCSTRet]
  end

  it '#icms_st_retained' do
    tax.icms_st_retained.must_equal cte_hash[:vICMSSTRet]
  end

  it '#icms_st_aliquot' do
    tax.icms_st_aliquot.must_equal cte_hash[:pICMSSTRet]
  end

  it '#credit' do
    tax.credit.must_equal cte_hash[:vCred]
  end

  it '#icms_base_reduction_another' do
    tax.icms_base_reduction_another.must_equal cte_hash[:pRedBCOutraUF]
  end

  it '#icms_base_another' do
    tax.icms_base_another.must_equal cte_hash[:vBCOutraUF]
  end

  it '#icms_percentage_another' do
    tax.icms_percentage_another.must_equal cte_hash[:pICMSOutraUF]
  end

  it '#icms_another' do
    tax.icms_another.must_equal cte_hash[:vICMSOutraUF]
  end

  it '#simple' do
    tax.simple.must_equal cte_hash[:indSN]
  end
end