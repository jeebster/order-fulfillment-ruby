require 'csv'
require_relative 'lib/fulfillment_processor'

CSV.foreach "#{Dir.pwd}/input/orders.csv", headers: true do |row|
  puts FulfillmentProcessor.new(row).execute
end