require_relative 'fulfillment_calculator'

class FulfillmentProcessor
  attr_reader :order_data

  def initialize(order_data)
    @order_data = order_data
  end

  def execute
    formatted_order = {
      type: order_data[0],
      cash: order_data[1].to_i,
      price: order_data[2].to_i,
      bonus_ratio: order_data[3].to_i
    }

    fulfillment_calculator = FulfillmentCalculator.new(formatted_order)

    fulfillment_calculator.fulfillments
                          .map { |k, v| "#{k} #{v}"}
                          .join(', ')
  end
end