module CteReader
  class Base
    def self.read(file)
      xml = file.is_a?(Nokogiri::XML::Document) ? file : Nokogiri::XML(file)

      if xml.at_css('enviCTe')
        CteReader::Lot.new(xml.to_hash)
      else
        CteReader::Cte.new(xml.to_hash)
      end
    ensure
      file.close if file.respond_to? :close
    end
  end
end