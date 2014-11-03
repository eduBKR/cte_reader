require File.expand_path("../../test_helper", __FILE__)

describe CteReader::Lot do

  let(:file) { File.open(File.expand_path("../../files/sample-lot.xml", __FILE__))}
  let (:lot) { CteReader::Base.read(File.open(file)) }

  it '#version' do
    lot.version.must_equal '2.00'
  end

  it '#lot_version' do
    lot.lot_version.must_equal '2.00'
  end

  it '#number' do
    lot.number.must_equal '1000'
  end

  it '#ctes' do
    lot.ctes.first.must_be_instance_of CteReader::Cte
  end

  it '#protocol' do
    lot.protocol.must_be_instance_of CteReader::Protocol
  end
end