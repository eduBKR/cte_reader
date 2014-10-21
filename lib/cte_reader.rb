# encoding: UTF-8
require "cte_reader/version"
require "nokogiri"
require "cte_reader/helpers/nokogiri_hash"
require "cte_reader/helpers/attribute_helper"
require "cte_reader/helpers/creator_helper"

%w(cte_reader cte_reader/information cte_reader/billing cte_reader/modal).each do |namespace|
  Dir[File.dirname(__FILE__) + "/../lib/#{namespace}/*.rb"].each { |file| require file }
end