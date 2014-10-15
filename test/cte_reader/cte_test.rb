require File.expand_path("../../test_helper", __FILE__)

describe Cte::Reader::Cte do
  let(:file) { File.open(File.expand_path("../../files/sample-cte.xml", __FILE__))}
  let(:cte) { Cte::Reader::Cte.new(File.open(file)) }

  it '#version_schema' do
    cte.version_schema.must_equal '2.00'
  end

  it '#signature' do
    cte.signature.must_be_instance_of Hash
  end

  it '#version' do
    cte.version.must_equal '2.00'
  end

  it '#key' do
    cte.key.must_equal 'CTe421135201476170039509622024098982747234729'
  end

  it '#modal_version' do
    cte.modal_version.must_equal '2.00'
  end

  it '#header' do
    cte.header.must_be_instance_of Cte::Reader::Header
  end

  it '#complement' do
    cte.complement.must_be_instance_of Cte::Reader::Complement
  end

  it '#emitter' do
    cte.emitter.must_be_instance_of Cte::Reader::Emitter
  end

  it '#sender' do
    cte.sender.must_be_instance_of Cte::Reader::Sender
  end

  it '#dispatcher' do
    cte.dispatcher.must_be_nil
  end

  it '#receiver' do
    cte.receiver.must_be_nil
  end

  it '#recipient' do
    cte.recipient.must_be_instance_of Cte::Reader::Recipient
  end

  it '#tax' do
    cte.tax.must_be_instance_of Cte::Reader::Tax
  end

  it '#information' do
    cte.information.must_be_instance_of Cte::Reader::Information
  end

  it '#complementary_key' do
    cte.complementary_key.must_be_nil
  end

  it '#cancellation_key' do
    cte.cancellation_key.must_be_nil
  end

  it '#cancellation_date' do
    cte.cancellation_date.must_be_nil
  end

  it '#authorizations' do
    cte.authorizations.must_be_nil
  end
end