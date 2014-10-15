# encoding: UTF-8
require "cte_reader/version"
require "nokogiri"
require "helpers/nokogiri_hash"
require "helpers/attribute_helper"
require "helpers/creator_helper"

%w(cte_reader cte_reader/information cte_reader/billing cte_reader/modal).each do |namespace|
  Dir[File.dirname(__FILE__) + "/../lib/#{namespace}/*.rb"].each { |file| require file }
end